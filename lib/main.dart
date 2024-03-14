// ignore_for_file: must_be_immutable

import 'package:cleanserv/services/connectivity_service.dart';
// import 'package:cleanserv/pages/splash/splash_middleware.dart';
import 'package:cleanserv/controller.dart';
import 'package:cleanserv/routes.dart'; 
import 'package:cleanserv/services/console.dart';
import 'package:cleanserv/services/message.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
//import 'package:hexcolor/hexcolor.dart';
//import 'package:status_bar_control/status_bar_control.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_storage/get_storage.dart';
//import 'package:shared_preferences/shared_preferences.dart';

///
/// Inicializar Servicios
///
Future<void> initServices() async {
  // Google Maps
  //await Get.putAsync(() => GoogleMap().init());
  //Check internet connectivity
  await Get.putAsync(() => ConnectivityService().init());
  // Mensajes
  await Get.putAsync(() => Message().init());
  // Logs
  await Get.putAsync(() => Console().init());
  // ...
  return;
}

void main() async {
  // Bloquear la orientación del dispositivo solo para vista en modo [Portrait]
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  // SystemChrome.setEnabledSystemUIOverlays(
  //     [SystemUiOverlay.top, SystemUiOverlay.bottom]);
  //await SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));

  //inicializar el storage
  await GetStorage.init();
  // Inicializar todos los servicios
  await initServices();
  // Declaramos al controlador global como parte de GetX para acceder a él
  // desde cualquier parte de nuestra aplicación.
  Get.put(GlobalController());
  
  
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // Establecer los estilos del Statusbar & Navbar
    // Control.setNavigationBarColor(AppColors.primaryColor);
    //StatusBarControl.setNavigationBarStyle(NavigationBarStyle.LIGHT);
    // Renderizar en GetX
    //final SplashMiddleware splashMiddleware = SplashMiddleware();

    // Cambiar el color de los iconos de la batería en la barra de estado
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarIconBrightness: Brightness
          .dark, // Cambia el brillo de los iconos de la barra de estado
    ));

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromRGBO(89, 38, 166, 13)),
        // primarySwatch: Colors.blue,

        // scaffoldBackgroundColor: Colors.grey.shade100,
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
        // colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey)
        //     .copyWith(secondary: AppColors.accentColor),
      ),
      title: 'NickyServices',
      // Internationalización
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('es'),
      ],
      // Rutas
      initialRoute: '/welcome',
      getPages: AppPages.pages,
      defaultTransition: Transition.fadeIn,
      opaqueRoute: false,
      enableLog: true,
    );
  }
}
