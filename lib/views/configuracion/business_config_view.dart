import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../models/business_config.dart';
import '../../services/isar_service.dart';
import '../../models/app_theme.dart';
import '../../models/font_config.dart';
import '../../services/app_config_service.dart';
import '../../widgets/permission_widget.dart';

class BusinessConfigView extends ConsumerStatefulWidget {
  const BusinessConfigView({super.key});

  @override
  ConsumerState<BusinessConfigView> createState() => _BusinessConfigViewState();
}

class _BusinessConfigViewState extends ConsumerState<BusinessConfigView> {
  final _formKey = GlobalKey<FormState>();
  final _businessNameController = TextEditingController();
  final _addressController = TextEditingController();
  final _cityController = TextEditingController();
  final _phoneController = TextEditingController();
  final _whatsappController = TextEditingController();
  final _emailController = TextEditingController();
  final _websiteController = TextEditingController();
  final _cuitController = TextEditingController();
  final _descriptionController = TextEditingController();

  bool _isLoading = true;
  bool _isSaving = false;
  BusinessConfig? _businessConfig;
  AppTheme? _currentTheme;
  FontConfig? _currentFontConfig;

  @override
  void initState() {
    super.initState();
    _loadTheme();
    _loadBusinessConfig();
  }

  @override
  void dispose() {
    _businessNameController.dispose();
    _addressController.dispose();
    _cityController.dispose();
    _phoneController.dispose();
    _whatsappController.dispose();
    _emailController.dispose();
    _websiteController.dispose();
    _cuitController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _loadTheme() async {
    final configService = ref.read(appConfigServiceProvider);
    final theme = await configService.getSelectedTheme();
    final fontConfig = await configService.getSelectedFontConfig();

    setState(() {
      _currentTheme = theme;
      _currentFontConfig = fontConfig;
    });
  }

  Future<void> _loadBusinessConfig() async {
    try {
      final isar = await ref.read(isarServiceProvider).db;

      // Buscar configuración existente o crear una nueva
      final results = await isar.businessConfigs.getAll([0]);
      if (results.isNotEmpty) {
        _businessConfig = results.first;
        _loadDataToControllers();
      } else {
        _businessConfig =
            BusinessConfig()
              ..businessName = 'NAJAM TIENDA OFICIAL'
              ..lastUpdated = DateTime.now();
      }

      setState(() => _isLoading = false);
    } catch (e) {
      setState(() => _isLoading = false);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al cargar configuración: $e')),
        );
      }
    }
  }

  void _loadDataToControllers() {
    if (_businessConfig == null) return;

    _businessNameController.text = _businessConfig!.businessName;
    _addressController.text = _businessConfig!.address ?? '';
    _cityController.text = _businessConfig!.city ?? '';
    _phoneController.text = _businessConfig!.phone ?? '';
    _whatsappController.text = _businessConfig!.whatsapp ?? '';
    _emailController.text = _businessConfig!.email ?? '';
    _websiteController.text = _businessConfig!.website ?? '';
    _cuitController.text = _businessConfig!.cuit ?? '';
    _descriptionController.text = _businessConfig!.description ?? '';
  }

  Future<void> _saveBusinessConfig() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isSaving = true);

    try {
      final isar = await ref.read(isarServiceProvider).db;

      _businessConfig ??= BusinessConfig();
      _businessConfig!.businessName = _businessNameController.text.trim();
      _businessConfig!.address = _addressController.text.trim();
      _businessConfig!.city = _cityController.text.trim();
      _businessConfig!.phone = _phoneController.text.trim();
      _businessConfig!.whatsapp = _whatsappController.text.trim();
      _businessConfig!.email = _emailController.text.trim();
      _businessConfig!.website = _websiteController.text.trim();
      _businessConfig!.cuit = _cuitController.text.trim();
      _businessConfig!.description = _descriptionController.text.trim();
      _businessConfig!.lastUpdated = DateTime.now();

      await isar.writeTxn(() async {
        await isar.businessConfigs.put(_businessConfig!);
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Configuración guardada exitosamente'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error al guardar: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isSaving = false);
      }
    }
  }

  Widget _buildFormField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
    int maxLines = 1,
  }) {
    final theme = _currentTheme ?? AppTheme.darkTheme;
    final fontConfig = _currentFontConfig ?? FontConfig.defaultConfig;

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: controller,
        style: TextStyle(
          color: theme.textColor,
          fontFamily: fontConfig.bodyFont,
        ),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            color: theme.textSecondaryColor,
            fontFamily: fontConfig.bodyFont,
          ),
          prefixIcon: Icon(icon, color: theme.primaryColor),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          filled: true,
          fillColor: theme.backgroundColor,
        ),
        keyboardType: keyboardType,
        validator: validator,
        maxLines: maxLines,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      final theme = _currentTheme ?? AppTheme.darkTheme;
      return Scaffold(
        backgroundColor: theme.backgroundColor,
        body: Center(
          child: CircularProgressIndicator(color: theme.primaryColor),
        ),
      );
    }

    final theme = _currentTheme ?? AppTheme.darkTheme;
    final fontConfig = _currentFontConfig ?? FontConfig.defaultConfig;

    return Scaffold(
      backgroundColor: theme.backgroundColor,
      appBar: AppBar(
        backgroundColor: theme.backgroundColor,
        title: Text(
          'Configuración del Negocio',
          style: TextStyle(color: theme.textColor),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: theme.textColor),
          onPressed: () => context.pop(),
        ),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Información básica
              Card(
                color: theme.surfaceColor,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Información Básica',
                        style: TextStyle(
                          color: theme.textColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: fontConfig.titleFont,
                        ),
                      ),
                      const SizedBox(height: 16),

                      _buildFormField(
                        controller: _businessNameController,
                        label: 'Nombre del Negocio *',
                        icon: Icons.business,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'El nombre del negocio es requerido';
                          }
                          return null;
                        },
                      ),

                      _buildFormField(
                        controller: _addressController,
                        label: 'Dirección',
                        icon: Icons.location_on,
                      ),

                      _buildFormField(
                        controller: _cityController,
                        label: 'Ciudad',
                        icon: Icons.location_city,
                      ),

                      _buildFormField(
                        controller: _cuitController,
                        label: 'CUIT',
                        icon: Icons.numbers,
                        keyboardType: TextInputType.number,
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Información de contacto
              Card(
                color: theme.surfaceColor,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Información de Contacto',
                        style: TextStyle(
                          color: theme.textColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: fontConfig.titleFont,
                        ),
                      ),
                      const SizedBox(height: 16),

                      _buildFormField(
                        controller: _phoneController,
                        label: 'Teléfono',
                        icon: Icons.phone,
                        keyboardType: TextInputType.phone,
                      ),

                      _buildFormField(
                        controller: _whatsappController,
                        label: 'WhatsApp',
                        icon: Icons.phone_android,
                        keyboardType: TextInputType.phone,
                      ),

                      _buildFormField(
                        controller: _emailController,
                        label: 'Email',
                        icon: Icons.email,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value != null && value.isNotEmpty) {
                            if (!RegExp(
                              r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                            ).hasMatch(value)) {
                              return 'Email inválido';
                            }
                          }
                          return null;
                        },
                      ),

                      _buildFormField(
                        controller: _websiteController,
                        label: 'Sitio Web',
                        icon: Icons.web,
                        keyboardType: TextInputType.url,
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Descripción
              Card(
                color: theme.surfaceColor,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Descripción del Negocio',
                        style: TextStyle(
                          color: theme.textColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: fontConfig.titleFont,
                        ),
                      ),
                      const SizedBox(height: 16),

                      _buildFormField(
                        controller: _descriptionController,
                        label: 'Descripción',
                        icon: Icons.description,
                        maxLines: 4,
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Botón guardar
              PermissionWidget(
                action: 'update',
                resource: 'configuracion',
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: _isSaving ? null : _saveBusinessConfig,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: theme.primaryColor,
                      foregroundColor: Colors.white,
                    ),
                    child:
                        _isSaving
                            ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                            : Text(
                              'Guardar Configuración',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontFamily: fontConfig.bodyFont,
                              ),
                            ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
