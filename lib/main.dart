import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'src/app_router.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/gestures.dart';
import 'services/app_config_service.dart';
import 'services/auth_service.dart';
import 'services/isar_service.dart';
import 'utils/logger.dart';

void main() {
  runApp(
    ProviderScope(
      child: WindowBorder(
        color: Colors.transparent,
        width: 0,
        child: const MyApp(),
      ),
    ),
  );

  doWhenWindowReady(() {
    const initialSize = Size(1280, 800);
    //appWindow.maxSize = initialSize; // 🔒 bloquea el resize
    appWindow.minSize = initialSize;
    appWindow.size = initialSize;
    appWindow.alignment = Alignment.center;
    appWindow.title = "NAJAM";
    appWindow.show();
  });

  logDev('App iniciada');
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  ThemeData? _currentTheme;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    try {
      // Inicializar la base de datos
      await ref.read(isarServiceProvider).db;

      // Crear admin por defecto
      final authService = ref.read(authServiceProvider);
      await authService.createDefaultAdmin();

      // Cargar tema
      await _loadTheme();
    } catch (e) {
      print('Error inicializando la aplicación: $e');
      // Continuar con la carga del tema incluso si hay error
      await _loadTheme();
    }
  }

  Future<void> _loadTheme() async {
    final configService = ref.read(appConfigServiceProvider);
    final themeData = await configService.getCurrentThemeData();

    setState(() {
      _currentTheme = themeData;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final router = ref.watch(routerProvider);

    if (_isLoading) {
      return MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.grey[900],
          body: Center(child: CircularProgressIndicator(color: Colors.blue)),
        ),
      );
    }

    return MaterialApp.router(
      scrollBehavior: DesktopScrollBehavior(),
      routerConfig: router,
      title: 'Tienda de Ropa - NAJAM',
      debugShowCheckedModeBanner: false,
      theme:
          _currentTheme ??
          ThemeData(
            useMaterial3: true,
            scaffoldBackgroundColor: Colors.black,
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.indigo,
              brightness: Brightness.dark,
            ),
          ),
      builder: (context, child) {
        // Make the app responsive
        final mediaQuery = MediaQuery.of(context);
        final scale = mediaQuery.textScaleFactor.clamp(0.8, 1.4);

        return MediaQuery(
          data: mediaQuery.copyWith(textScaler: TextScaler.linear(scale)),
          child: child!,
        );
      },
    );
  }
}

class DesktopScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.mouse,
    PointerDeviceKind.touch,
    PointerDeviceKind.stylus,
  };
}
