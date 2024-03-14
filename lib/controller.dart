import 'dart:convert';

import 'package:cleanserv/environment.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

///
/// Controlador Global
///
class GlobalController extends GetxController {
  ///
  /// Datos del storage local de la aplicación
  ///
  Map<String, dynamic> localStorageData = {
    'current-user': {
      'name': '',
      'username': '',
      'isAdmin': false,
      'token': '',
      'showSplash': true,
      'isSuperAdmin': false,
    },
  };

  //RxString cookies = ''.obs;
  RxBool conectedInternet = false.obs;

  String token = '';
  String name = '';
  String username = '';
  bool isAdmin = false;

  RxString accessToken = ''.obs;

  @override
  void onInit() async {
    super.onInit();

    localStorageInit();
  }

  localStorageInit() async {
    // Inicializar el Storage Nativo
    await GetStorage.init();
    GetStorage storage = GetStorage();
    // await storage.write(Environment.localStorageKey, jsonEncode(localStorageData));
    await storage.writeIfNull(
        Environment.localStorageKey, jsonEncode(localStorageData));
    // Obtenemos los valores almacenados en el Storage Nativo
    String data = storage.read(Environment.localStorageKey);
    // Descodificamos y actualizamos la data
    localStorageData = jsonDecode(data);
  }

  localStorageUpdate() {
    // Instanciar el Storage Nativo y actualizar el estado global
    GetStorage storage = GetStorage();
    storage.write(Environment.localStorageKey, jsonEncode(localStorageData));
  }
}
