// ignore_for_file: unnecessary_overrides

import 'dart:io';

import 'package:cleanserv/environment.dart';
import 'package:cleanserv/services/message.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
// import 'package:flutter/src/scheduler/ticker.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class DashboardController extends GetxController implements TickerProvider {
  final box = GetStorage();
  late final HttpLink httpLink;
  late final AuthLink authLink;
  late final Link link;

  DashboardController() {
    httpLink = HttpLink(Environment.endpoint);
    authLink = AuthLink(
      getToken: () async {
        final box = GetStorage();
        final authToken = await box.read('authToken');
        return 'JWT $authToken';
      },
      headerKey: 'Authorization',
    );
    link = authLink.concat(httpLink);
  }
  // late final FlutterSecureStorage _storage;
  // final box = GetStorage();
  // late final TabController tabController;
  var currentIndex = 0.obs;
  // final HttpLink httpLink = HttpLink(Environment.endpoint);
  // final HttpLink httpLink = HttpLink(uri: 'YOUR_GRAPHQL_ENDPOINT');
  // final AuthLink authLink = AuthLink(
  //   getToken: () async {
  //     final box = GetStorage();
  //     final authToken = await box.read('authToken');
  //     return authToken;
  //   },
  // );
  // final Link link = authLink.concat(httpLink);

  void changePage(int index) {
    currentIndex.value = index;
  }

  @override
  void onInit() {
    super.onInit();
    // tabController = TabController(length: 2, vsync: this);
    // _storage = const FlutterSecureStorage();
  }

  @override
  void onClose() {
    // tabController.dispose();
    super.onClose();
  }

  Future<void> logout() async {
    // await _storage.delete(key: 'authToken');
    box.remove('authToken');
    Get.offAllNamed('/login');
  }

  // Future<void> onlogout() async {
  //   final confirmed = await confirmLogout();
  //   if (confirmed) {
  //     box.remove('authToken');
  //     Get.offAllNamed('/login');
  //   }
  // }

  Future<bool> confirmLogout(BuildContext context) async {
    final result = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Logout'),
          content: const Text('Are you sure you want to logout the app?'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () async {
                logout();
              },
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );
    return result ?? false;
  }

  // Confirmar para cerrar sesión de usuario
  Future<bool?> onExitApp(BuildContext context) {
    // Pedir confirmación al usuario para salir de la aplicación
    return Message.service.confirm(
      context,
      title: 'Confirmation',
      message: 'You are closing application?',
      confirmLabel: 'OK',
      cancelLabel: 'Cancel',
      onConfirm: () async {
        // Salir del app completamente
        exit(0);
      },
    );
  }

  @override
  Ticker createTicker(onTick) => Ticker(onTick);

  Future<bool> exitApp(BuildContext context) async {
    final result = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Exit'),
          content: const Text('Are you sure you want to exit the app?'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () async {
                // Salir del app completamente
                exit(0);
              },
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );
    return result ?? false;
  }
}
