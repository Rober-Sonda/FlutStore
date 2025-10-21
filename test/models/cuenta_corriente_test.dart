import 'package:flutter_test/flutter_test.dart';
import 'package:tienda_app/models/cuenta_corriente.dart';

void main() {
  group('CuentaCorriente Model Tests - TDD', () {
    late CuentaCorriente cuenta;
    late DateTime fechaCreacion;
    late DateTime fechaVencimiento;
    
    setUp(() {
      // Arrange: Configurar objeto base para cada test
      fechaCreacion = DateTime(2024, 1, 15);
      fechaVencimiento = DateTime(2024, 3, 15); // 2 meses después
      
      cuenta = CuentaCorriente(
        clienteId: 1,
        nombreCliente: 'María González',
        montoTotal: 1200.00,
        fechaCreacion: fechaCreacion,
        fechaVencimiento: fechaVencimiento,
        totalCuotas: 4,
        observaciones: 'Compra de temporada invierno',
      );
    });

    group('Constructor Tests', () {
      test('debe crear cuenta corriente with valores requeridos', () {
        // Arrange & Act
        final nuevaCuenta = CuentaCorriente(
          clienteId: 2,
          nombreCliente: 'Juan Pérez',
          montoTotal: 800.00,
          fechaCreacion: DateTime.now(),
          fechaVencimiento: DateTime.now().add(Duration(days: 30)),
        );
        
        // Assert
        expect(nuevaCuenta.clienteId, equals(2));
        expect(nuevaCuenta.nombreCliente, equals('Juan Pérez'));
        expect(nuevaCuenta.montoTotal, equals(800.00));
        expect(nuevaCuenta.montoPagado, equals(0.0));
        expect(nuevaCuenta.saldoPendiente, equals(800.00));
        expect(nuevaCuenta.totalCuotas, equals(1));
        expect(nuevaCuenta.cuotasPagadas, equals(0));
        expect(nuevaCuenta.activa, isTrue);
      });

      test('debe calcular saldo pendiente y monto por cuota correctamente', () {
        // Act & Assert
        expect(cuenta.saldoPendiente, equals(1200.00));
        expect(cuenta.montoPorCuota, equals(300.00)); // 1200 / 4
      });

      test('debe crear cuenta con valores completos', () {
        // Act & Assert
        expect(cuenta.clienteId, equals(1));
        expect(cuenta.nombreCliente, equals('María González'));
        expect(cuenta.montoTotal, equals(1200.00));
        expect(cuenta.montoPagado, equals(0.0));
        expect(cuenta.totalCuotas, equals(4));
        expect(cuenta.observaciones, equals('Compra de temporada invierno'));
        expect(cuenta.activa, isTrue);
      });
    });

    group('Payment Registration Tests', () {
      test('debe registrar pago parcial correctamente', () {
        // Act
        cuenta.registrarPago(300.00, 'efectivo', 'PAGO001');
        
        // Assert
        expect(cuenta.montoPagado, equals(300.00));
        expect(cuenta.saldoPendiente, equals(900.00));
        expect(cuenta.cuotasPagadas, equals(1));
        expect(cuenta.metodoPago, equals('efectivo'));
        expect(cuenta.referenciaPago, equals('PAGO001'));
        expect(cuenta.fechaUltimoPago, isNotNull);
        expect(cuenta.estaPagada, isFalse);
      });

      test('debe registrar pago total y marcar como pagada', () {
        // Act
        cuenta.registrarPago(1200.00, 'transferencia', 'TRANSF123');
        
        // Assert
        expect(cuenta.montoPagado, equals(1200.00));
        expect(cuenta.saldoPendiente, equals(0.0));
        expect(cuenta.cuotasPagadas, equals(4));
        expect(cuenta.estaPagada, isTrue);
        expect(cuenta.metodoPago, equals('transferencia'));
        expect(cuenta.referenciaPago, equals('TRANSF123'));
      });

      test('debe registrar múltiples pagos parciales', () {
        // Act
        cuenta.registrarPago(200.00, 'efectivo', 'PAGO001');
        cuenta.registrarPago(300.00, 'tarjeta', 'TARJ002');
        cuenta.registrarPago(250.00, 'efectivo', 'PAGO003');
        
        // Assert
        expect(cuenta.montoPagado, equals(750.00));
        expect(cuenta.saldoPendiente, equals(450.00));
        expect(cuenta.cuotasPagadas, equals(2)); // 750 / 300 = 2.5, floor = 2
        expect(cuenta.metodoPago, equals('efectivo')); // Último método usado
        expect(cuenta.referenciaPago, equals('PAGO003')); // Última referencia
      });

      test('debe manejar sobrepago correctamente', () {
        // Act
        cuenta.registrarPago(1500.00, 'efectivo', 'SOBREPAGO');
        
        // Assert
        expect(cuenta.montoPagado, equals(1500.00));
        expect(cuenta.saldoPendiente, equals(-300.00)); // Saldo a favor
        expect(cuenta.estaPagada, isTrue);
        expect(cuenta.cuotasPagadas, equals(5)); // 1500 / 300 = 5
      });
    });

    group('Status and Validation Tests', () {
      test('debe detectar cuenta no pagada correctamente', () {
        // Act & Assert
        expect(cuenta.estaPagada, isFalse);
        expect(cuenta.saldoPendiente > 0, isTrue);
      });

      test('debe detectar cuenta pagada después del pago total', () {
        // Arrange & Act
        cuenta.registrarPago(1200.00, 'efectivo', 'PAGO_TOTAL');
        
        // Assert
        expect(cuenta.estaPagada, isTrue);
        expect(cuenta.saldoPendiente, equals(0.0));
      });

      test('debe detectar cuenta vencida correctamente', () {
        // Arrange - Crear cuenta vencida
        final cuentaVencida = CuentaCorriente(
          clienteId: 3,
          nombreCliente: 'Cliente Vencido',
          montoTotal: 500.00,
          fechaCreacion: DateTime.now().subtract(Duration(days: 60)),
          fechaVencimiento: DateTime.now().subtract(Duration(days: 10)),
        );
        
        // Act & Assert
        expect(cuentaVencida.estaVencida, isTrue);
        expect(cuentaVencida.diasAtraso, equals(10));
      });

      test('debe calcular días de atraso correctamente', () {
        // Arrange - Cuenta vencida hace 5 días
        final cuentaAtrasada = CuentaCorriente(
          clienteId: 4,
          nombreCliente: 'Cliente Atrasado',
          montoTotal: 300.00,
          fechaCreacion: DateTime.now().subtract(Duration(days: 40)),
          fechaVencimiento: DateTime.now().subtract(Duration(days: 5)),
        );
        
        // Act & Assert
        expect(cuentaAtrasada.diasAtraso, equals(5));
        expect(cuentaAtrasada.estaVencida, isTrue);
      });

      test('debe retornar cero días de atraso para cuenta pagada', () {
        // Arrange
        cuenta.registrarPago(1200.00, 'efectivo', 'PAGO_TOTAL');
        
        // Act & Assert
        expect(cuenta.diasAtraso, equals(0));
        expect(cuenta.estaVencida, isFalse);
      });
    });

    group('Percentage and Progress Tests', () {
      test('debe calcular porcentaje pagado correctamente', () {
        // Act
        cuenta.registrarPago(600.00, 'efectivo', 'PAGO_MITAD');
        
        // Assert
        expect(cuenta.porcentajePagado, equals(50.0));
      });

      test('debe calcular porcentaje para diferentes montos', () {
        // Arrange & Act
        final porcentajes = [
          {'pago': 0.0, 'esperado': 0.0},
          {'pago': 300.0, 'esperado': 25.0},
          {'pago': 900.0, 'esperado': 75.0},
          {'pago': 1200.0, 'esperado': 100.0},
        ];
        
        // Assert
        for (final caso in porcentajes) {
          final cuentaTest = CuentaCorriente(
            clienteId: 999,
            nombreCliente: 'Test',
            montoTotal: 1200.00,
            fechaCreacion: DateTime.now(),
            fechaVencimiento: DateTime.now().add(Duration(days: 30)),
          );
          
          cuentaTest.registrarPago(caso['pago']! as double, 'test', 'TEST');
          expect(cuentaTest.porcentajePagado, equals(caso['esperado']));
        }
      });
    });

    group('Installments Management Tests', () {
      test('debe calcular cuotas restantes correctamente', () {
        // Act
        cuenta.registrarPago(600.00, 'efectivo', 'PAGO'); // 2 cuotas pagadas
        
        // Assert
        expect(cuenta.cuotasPagadas, equals(2));
        expect(cuenta.cuotasRestantes, equals(2));
      });

      test('debe calcular monto de próxima cuota correctamente', () {
        // Act & Assert sin pagos
        expect(cuenta.montoProximaCuota, equals(300.00));
        
        // Act & Assert después de pago parcial
        cuenta.registrarPago(150.00, 'efectivo', 'PAGO_PARCIAL');
        expect(cuenta.montoProximaCuota, equals(300.00)); // Sigue siendo el monto por cuota
        
        // Act & Assert cuando está pagada
        cuenta.registrarPago(1050.00, 'efectivo', 'PAGO_RESTO');
        expect(cuenta.montoProximaCuota, equals(0.0));
      });

      test('debe manejar plan de cuotas de una sola cuota', () {
        // Arrange & Act
        final cuentaUnicaCuota = CuentaCorriente(
          clienteId: 5,
          nombreCliente: 'Cliente Contado',
          montoTotal: 500.00,
          fechaCreacion: DateTime.now(),
          fechaVencimiento: DateTime.now().add(Duration(days: 30)),
          totalCuotas: 1,
        );
        
        // Assert
        expect(cuentaUnicaCuota.montoPorCuota, equals(500.00));
        expect(cuentaUnicaCuota.cuotasRestantes, equals(1));
        expect(cuentaUnicaCuota.montoProximaCuota, equals(500.00));
      });
    });

    group('Business Logic Tests', () {
      test('debe manejar cuenta activa/inactiva', () {
        // Act & Assert inicial
        expect(cuenta.activa, isTrue);
        
        // Act - Desactivar cuenta
        cuenta.activa = false;
        
        // Assert
        expect(cuenta.activa, isFalse);
      });

      test('debe almacenar observaciones de negocio', () {
        // Act & Assert
        expect(cuenta.observaciones, equals('Compra de temporada invierno'));
        
        // Act - Actualizar observaciones
        cuenta.observaciones = 'Cliente preferencial - descuento aplicado';
        
        // Assert
        expect(cuenta.observaciones, equals('Cliente preferencial - descuento aplicado'));
      });

      test('debe manejar referencias de pago para trazabilidad', () {
        // Act
        cuenta.registrarPago(300.00, 'tarjeta', 'TXN_123456789');
        
        // Assert
        expect(cuenta.referenciaPago, equals('TXN_123456789'));
        expect(cuenta.metodoPago, equals('tarjeta'));
      });
    });

    group('Edge Cases Tests', () {
      test('debe manejar monto total cero', () {
        // Arrange & Act
        final cuentaCero = CuentaCorriente(
          clienteId: 6,
          nombreCliente: 'Cuenta Cero',
          montoTotal: 0.0,
          fechaCreacion: DateTime.now(),
          fechaVencimiento: DateTime.now().add(Duration(days: 30)),
        );
        
        // Assert
        expect(cuentaCero.estaPagada, isTrue);
        expect(cuentaCero.saldoPendiente, equals(0.0));
        expect(cuentaCero.porcentajePagado, isNaN); // 0/0 = NaN
      });

      test('debe manejar fechas límite en el mismo día', () {
        // Arrange & Act
        final cuentaHoy = CuentaCorriente(
          clienteId: 7,
          nombreCliente: 'Vence Hoy',
          montoTotal: 100.00,
          fechaCreacion: DateTime.now().subtract(Duration(days: 1)),
          fechaVencimiento: DateTime.now(),
        );
        
        // Assert - En el día de vencimiento aún no está vencida
        expect(cuentaHoy.estaVencida, isFalse);
        expect(cuentaHoy.diasAtraso, equals(0));
      });
    });

    group('Integration Tests', () {
      test('debe simular ciclo completo de pagos por cuotas', () {
        // Arrange - Plan de 4 cuotas de $300 c/u
        expect(cuenta.totalCuotas, equals(4));
        expect(cuenta.montoPorCuota, equals(300.00));
        
        // Act & Assert - Primera cuota
        cuenta.registrarPago(300.00, 'efectivo', 'CUOTA_1');
        expect(cuenta.cuotasPagadas, equals(1));
        expect(cuenta.cuotasRestantes, equals(3));
        expect(cuenta.porcentajePagado, equals(25.0));
        
        // Act & Assert - Segunda cuota
        cuenta.registrarPago(300.00, 'tarjeta', 'CUOTA_2');
        expect(cuenta.cuotasPagadas, equals(2));
        expect(cuenta.cuotasRestantes, equals(2));
        expect(cuenta.porcentajePagado, equals(50.0));
        
        // Act & Assert - Tercera cuota
        cuenta.registrarPago(300.00, 'transferencia', 'CUOTA_3');
        expect(cuenta.cuotasPagadas, equals(3));
        expect(cuenta.cuotasRestantes, equals(1));
        expect(cuenta.porcentajePagado, equals(75.0));
        
        // Act & Assert - Cuota final
        cuenta.registrarPago(300.00, 'efectivo', 'CUOTA_4');
        expect(cuenta.estaPagada, isTrue);
        expect(cuenta.cuotasPagadas, equals(4));
        expect(cuenta.cuotasRestantes, equals(0));
        expect(cuenta.porcentajePagado, equals(100.0));
      });
    });
  });
}