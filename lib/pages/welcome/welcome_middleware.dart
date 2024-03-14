import 'package:flutter/material.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class WelcomeMiddleware extends GetMiddleware {
  final box = GetStorage();
  // final FlutterSecureStorage _storage = const FlutterSecureStorage();

  @override
  RouteSettings? redirect(String? route) {
    if (route == '/welcome') {
      // Si la ruta es splash, verifica si la pantalla ya ha sido mostrada antes
      // if (box.read('isSplashShown') == true) {
      //   // Si la pantalla ya ha sido mostrada, redirige a la pantalla de inicio de sesión
      //   _storage.read(key: 'authToken').then((authToken) {
      //     if (authToken == null) {
      //       return const RouteSettings(name: '/login');
      //     }
      //   });
      //   return const RouteSettings(name: '/dashboard');
      // }
      // if (box.read('isSplashShown') == true) {
      // _storage.read(key: 'authToken').then((authToken) {
      //   if (authToken != null) {
      //     return const RouteSettings(name: '/dashboard');
      //   }
      //   //else {
      //   //   // Future.delayed(const Duration(milliseconds: 500));
      //   //   return const RouteSettings(name: '/dashboard');
      //   // }
      // });
      if (box.read('authToken') != null) {
        return const RouteSettings(name: '/dashboard');
      } else {
        // return const RouteSettings(name: '/login');
        return null;
      }
      // }
      //else {
      //   // Si la pantalla no ha sido mostrada, marca la bandera y continúa a la pantalla de splash
      //   box.write('isSplashShown', true);
      //   return null;
      // }
    } else {
      // En cualquier otra ruta, continúa normalmente sin redirigir
      return null;
    }
  }
}
// import 'package:flutter/material.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';

// class SplashMiddleware extends GetMiddleware {
//   final box = GetStorage();
//   final FlutterSecureStorage _storage = const FlutterSecureStorage();

//   @override
//   RouteSettings? redirect(String? route) {
//     if (route == '/splash') {
//       redirectBuilder();
//       return null; // No redirigir de inmediato, dejamos que redirectBuilder maneje la redirección
//     } else {
//       return null;
//     }
//   }

//   void redirectBuilder() async {
//     if (await box.read('isSplashShown') == true) {
//       final authToken = await _storage.read(key: 'authToken');
//       if (authToken == null) {
//         Get.offNamed('/login'); // Redirigir a la pantalla de inicio de sesión
//       } else {
//         Get.offNamed('/dashboard'); // Redirigir a la pantalla de inicio
//       }
//     } else {
//       box.write('isSplashShown', true);
//     }
//   }
// }
