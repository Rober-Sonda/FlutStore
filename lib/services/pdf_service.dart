import 'dart:io';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import '../models/pedido_proveedor.dart';
import '../models/proveedor.dart';
import '../models/business_config.dart';

class PdfService {
  static Future<File> generateOrderPdf({
    required PedidoProveedor pedido,
    required Proveedor proveedor,
    required BusinessConfig businessConfig,
  }) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        build:
            (context) => [
              _buildHeader(businessConfig),
              _buildOrderInfo(pedido, proveedor),
              _buildOrderItems(pedido),
              _buildFooter(businessConfig),
            ],
      ),
    );

    final output = await getTemporaryDirectory();
    final file = File('${output.path}/pedido_${pedido.id}.pdf');
    await file.writeAsBytes(await pdf.save());
    return file;
  }

  static pw.Widget _buildHeader(BusinessConfig businessConfig) {
    return pw.Container(
      padding: const pw.EdgeInsets.all(20),
      decoration: pw.BoxDecoration(
        border: pw.Border(bottom: pw.BorderSide(color: PdfColors.grey300)),
      ),
      child: pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
          pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text(
                businessConfig.businessName,
                style: pw.TextStyle(
                  fontSize: 24,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              if (businessConfig.address != null)
                pw.Text(
                  businessConfig.address!,
                  style: const pw.TextStyle(fontSize: 12),
                ),
              if (businessConfig.city != null)
                pw.Text(
                  businessConfig.city!,
                  style: const pw.TextStyle(fontSize: 12),
                ),
              if (businessConfig.phone != null)
                pw.Text(
                  'Tel: ${businessConfig.phone}',
                  style: const pw.TextStyle(fontSize: 12),
                ),
              if (businessConfig.whatsapp != null)
                pw.Text(
                  'WhatsApp: ${businessConfig.whatsapp}',
                  style: const pw.TextStyle(fontSize: 12),
                ),
            ],
          ),
          // Logo placeholder (se puede implementar más adelante)
          pw.Container(
            width: 80,
            height: 80,
            decoration: pw.BoxDecoration(
              border: pw.Border.all(color: PdfColors.grey300),
            ),
            child: pw.Center(
              child: pw.Text('LOGO', style: const pw.TextStyle(fontSize: 12)),
            ),
          ),
        ],
      ),
    );
  }

  static pw.Widget _buildOrderInfo(
    PedidoProveedor pedido,
    Proveedor proveedor,
  ) {
    return pw.Container(
      padding: const pw.EdgeInsets.all(20),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text(
            'PEDIDO A PROVEEDOR',
            style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold),
          ),
          pw.SizedBox(height: 10),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text('Proveedor: ${proveedor.nombre}'),
                  if (proveedor.razonSocial != null)
                    pw.Text('Razón Social: ${proveedor.razonSocial}'),
                  if (proveedor.direccion != null)
                    pw.Text('Dirección: ${proveedor.direccion}'),
                ],
              ),
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.end,
                children: [
                  pw.Text('Pedido #${pedido.id}'),
                  pw.Text('Fecha: ${_formatDate(pedido.fechaCreacion)}'),
                  pw.Text('Estado: ${_getStatusText(pedido.estado)}'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  static pw.Widget _buildOrderItems(PedidoProveedor pedido) {
    return pw.Container(
      padding: const pw.EdgeInsets.all(20),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text(
            'ARTÍCULOS SOLICITADOS',
            style: pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold),
          ),
          pw.SizedBox(height: 10),
          pw.Table(
            border: pw.TableBorder.all(color: PdfColors.grey300),
            columnWidths: const {
              0: pw.FlexColumnWidth(1),
              1: pw.FlexColumnWidth(1),
              2: pw.FlexColumnWidth(1),
              3: pw.FlexColumnWidth(1),
            },
            children: [
              // Header
              pw.TableRow(
                decoration: pw.BoxDecoration(color: PdfColors.grey200),
                children: [
                  pw.Padding(
                    padding: const pw.EdgeInsets.all(8),
                    child: pw.Text(
                      'Producto',
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                    ),
                  ),
                  pw.Padding(
                    padding: const pw.EdgeInsets.all(8),
                    child: pw.Text(
                      'Cantidad',
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                    ),
                  ),
                  pw.Padding(
                    padding: const pw.EdgeInsets.all(8),
                    child: pw.Text(
                      'Precio Est.',
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                    ),
                  ),
                  pw.Padding(
                    padding: const pw.EdgeInsets.all(8),
                    child: pw.Text(
                      'Subtotal',
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                    ),
                  ),
                ],
              ),
              // Items
              ...pedido.items.map(
                (item) => pw.TableRow(
                  children: [
                    pw.Padding(
                      padding: const pw.EdgeInsets.all(8),
                      child: pw.Text(item.nombreProducto),
                    ),
                    pw.Padding(
                      padding: const pw.EdgeInsets.all(8),
                      child: pw.Text(item.cantidad.toString()),
                    ),
                    pw.Padding(
                      padding: const pw.EdgeInsets.all(8),
                      child: pw.Text(
                        item.precioEstimado != null
                            ? '\$${item.precioEstimado!.toStringAsFixed(2)}'
                            : 'N/A',
                      ),
                    ),
                    pw.Padding(
                      padding: const pw.EdgeInsets.all(8),
                      child: pw.Text(
                        item.precioEstimado != null
                            ? '\$${(item.precioEstimado! * item.cantidad).toStringAsFixed(2)}'
                            : 'N/A',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          pw.SizedBox(height: 20),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.end,
            children: [
              pw.Text(
                'Total Estimado: \$${pedido.calcularTotalEstimado().toStringAsFixed(2)}',
                style: pw.TextStyle(
                  fontSize: 16,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  static pw.Widget _buildFooter(BusinessConfig businessConfig) {
    return pw.Container(
      padding: const pw.EdgeInsets.all(20),
      decoration: pw.BoxDecoration(
        border: pw.Border(top: pw.BorderSide(color: PdfColors.grey300)),
      ),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text(
            'Observaciones:',
            style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
          ),
          pw.Text(
            'Este pedido no incluye precios finales. Los precios serán confirmados al momento de la compra.',
          ),
          pw.SizedBox(height: 20),
          pw.Text(
            'Gracias por su atención',
            style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
          ),
        ],
      ),
    );
  }

  static String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
  }

  static String _getStatusText(String status) {
    switch (status) {
      case PedidoProveedor.estadoBorrador:
        return 'Borrador';
      case PedidoProveedor.estadoEnviado:
        return 'Enviado';
      case PedidoProveedor.estadoRecibido:
        return 'Recibido';
      case PedidoProveedor.estadoCancelado:
        return 'Cancelado';
      default:
        return 'Desconocido';
    }
  }

  // Método para compartir el PDF
  static Future<void> sharePdf({
    required PedidoProveedor pedido,
    required Proveedor proveedor,
    required BusinessConfig businessConfig,
  }) async {
    try {
      final file = await generateOrderPdf(
        pedido: pedido,
        proveedor: proveedor,
        businessConfig: businessConfig,
      );

      await Share.shareXFiles([
        XFile(file.path),
      ], text: 'Pedido #${pedido.id} para ${proveedor.nombre}');
    } catch (e) {
      throw Exception('Error al compartir PDF: $e');
    }
  }
}
