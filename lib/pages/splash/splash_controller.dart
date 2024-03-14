//import 'package:flutter/material.dart';
//import 'package:fluttertoast/fluttertoast.dart';

//import 'package:shared_preferences/shared_preferences.dart';

import 'package:get/get.dart';

class SplashController extends GetxController {
  //late SharedPreferences sp;
  // @override
  // void onInit() async {
  //   super.onInit();
  //Future.delayed(const Duration(seconds: 2), () async {
  // SharedPreferences prefs = await SharedPreferences.getInstance();

  // bool isFirstTime = prefs.getBool('isFirstTime') ?? true;
  // if (isFirstTime) {
  //   prefs.setBool('isFirstTime', false);
  //   //Get.offNamed('/login');

  // } else {
  // if (isLoggedIn()) {
  //   Get.offNamed(AppRoutes.home);
  // } else {
  //   Get.offNamed(AppRoutes.login);
  // }
  // Fluttertoast.showToast(
  //   msg: "Splash init!",
  //   gravity: ToastGravity.BOTTOM,
  //   backgroundColor: Colors.red[400],
  //   textColor: Colors.white,
  //   fontSize: 16.0,
  // );
  //   Get.offNamed('/login');
  // }
  //});
  // }

  //@override
  // void onReady() {
  //   super.onReady();
  //   // Esperar 2 segundos e ir a la interfaz del login
  //   // Future.delayed(const Duration(seconds: 4), () {
  //   //   Get.offNamed('/login');
  //   // });
  // }

  // @override
  // void onClose() {
  //sp.setBool('isFirstTime', false);
  //Get.toNamed('/login');
  // Fluttertoast.showToast(
  //   msg: "Splash Cerrado!",
  //   gravity: ToastGravity.BOTTOM,
  //   backgroundColor: Colors.red[400],
  //   textColor: Colors.white,
  //   fontSize: 16.0,
  // );
  //   super.onClose();
  //   // ...
  // }
}
