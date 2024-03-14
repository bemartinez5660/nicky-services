import 'dart:developer' as developer;

import 'package:get/get.dart';

///
/// Servicio para imprimir de manera personalizada los logs en la consola
///
class Console {
  static Console get service => Get.find();
  Future<Console> init() async => this;

  ///
  /// Imprimir un mensaje de información en la consola
  ///
  log(dynamic obj) {
    developer.log('\x1B[32m$obj\x1B[0m', name: 'CLEANSERV');
  }

  ///
  /// Imprimir un mensaje de error en la consola
  ///
  error(dynamic obj) {
    developer.log('\x1B[31m$obj\x1B[0m', name: 'CLEANSERV');
  }
}
