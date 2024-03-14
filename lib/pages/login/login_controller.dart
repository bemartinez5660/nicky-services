// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:io';
// import 'package:cleanserv/services/connectivity_service.dart';
// import 'package:cleanserv/services/console.dart';
// import 'package:cleanserv/services/message.dart';
// import 'package:cleanserv/services/nicky.dart';
import 'package:cleanserv/environment.dart';
import 'package:cleanserv/graphql_config.dart';
import 'package:cleanserv/services/message.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
//import 'package:cleanserv/controller.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
// import 'package:cleanserv/services/authService.dart';
import 'package:cleanserv/graphql_strings.dart' as gql_str;
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:cleanserv/themes/app_colors.dart';
import 'package:google_sign_in/google_sign_in.dart';

// class LoginData {
//   String? username;
//   String? password;

//   LoginData({this.username, this.password});
// }

class LoginController extends GetxController {
  //GlobalController ctrlGlobal;
  //final formKey = GlobalKey<FormState>();
  // Observable para mostrar u ocultar la contraseña
  RxBool obscure = true.obs;
  var isLoggedIn = false.obs;
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  // var loginData = LoginData().obs;
  // Observable para mostrar u ocultar el loading
  RxBool isLoading = false.obs;
  final RxBool passwordVisible = false.obs;
  late GraphQLClient _client;
  // Controladores del formulario para los diferentes inputs de textos
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  FocusNode emailFocus = FocusNode();

  final _error = Rxn<String>();

  String? get error => _error.value;
  static GraphQLConfig graphQLConfig = GraphQLConfig();
  // Future<GraphQLClient> client = graphQLConfig.clientToQuery();
  // late final FlutterSecureStorage _storage;
  final box = GetStorage();
  // ...

  // LoginController({
  //   required this.ctrlGlobal,
  // });

  @override
  void onInit() async {
    // ...
    emailController.text = 'devhj2000@gmail.com';
    passwordController.text = 'Qq123456*';
    // ...
    _client = GraphQLClient(
      cache: GraphQLCache(),
      link: HttpLink(Environment.endpoint),
    );
    // _storage = const FlutterSecureStorage();

    // ever(isLoggedIn, handleAuthChanged);
    // handleAuthChanged(isLoggedIn.value);
    super.onInit();
  }

  // @override
  // void onReady() {
  //   super.onReady();
  //   // final checkConnection = Get.find<ConnectivityService>();
  //   // checkConnection.init();
  //   // ...
  // }

  // @override
  // void onClose() {
  //   //onExitApp(context);
  //   super.onClose();
  // }
  void showLoading() {
    isLoading.value = true;
  }

  void hideLoading() {
    isLoading.value = false;
  }

  onForgotPassword() async {
    bool register = await Get.toNamed('/forgot');
    if (register) {
      onRegister();
    }
  }

  onRegister() {
    Get.toNamed('/register');
  }

  // void handleAuthChanged(bool isLoggedIn) {
  //   if (!isLoggedIn) {
  //     // Get.offAllNamed('/login');
  //   }
  // }
  void showMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.red[400],
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  onLogin() async {
    // Establecer el foco en el edit del email
    // emailFocus.requestFocus();
    // ...
    if (loginFormKey.currentState!.validate()) {
      _error.value = null;
      try {
        isLoading.value = true;
        QueryResult result = await _client
            .mutate(
              MutationOptions(
                fetchPolicy: FetchPolicy.networkOnly,
                document: gql(gql_str.login),
                variables: {
                  'email': emailController.text,
                  'password': passwordController.text
                },
                errorPolicy: ErrorPolicy.all,
              ),
            )
            .timeout(const Duration(seconds: 20));
        isLoading.value = false;
        if (result.hasException) {
          final error = result.exception!;
          if (error.graphqlErrors.isNotEmpty) {
            final errorMessage = error.graphqlErrors[0].message;
            showMessage(errorMessage);
          } else {
            showMessage('Conextion not available, please repeat again');
          }
        } else {
          final String token = result.data!['login']['token'];
          // await _storage.write(key: 'authToken', value: token);
          box.write('authToken', token);
          // Get.toNamed('/dashboard');
          Get.offAllNamed('/dashboard');
        }
      } on TimeoutException {
        isLoading.value = false;
        showMessage('Connection timeout, please try again');
      } catch (e) {
        isLoading.value = false;
        showMessage('Error: $e');
      }
    }
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

  Future<void> loginWithGoogle() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      // final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
      // GoogleSignInOptions gso = new GoogleSignInOptions.Builder(GoogleSignInOptions.DEFAULT_SIGN_IN)
      //   .requestEmail()
      //   .build();

      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser != null) {
        // Autenticación exitosa
        // final GoogleSignInAuthentication googleAuth =
        //     await googleUser.authentication;

        // final credential = GoogleAuthProvider
        // final String? accessToken = googleAuth.accessToken;
        // final String? idToken = googleAuth.idToken;

        // Aquí puedes realizar las acciones necesarias con los datos de autenticación de Google
        // Por ejemplo, enviar los tokens a tu backend para verificar la autenticidad del usuario

        Get.snackbar('Success', 'Google authentication successful');
      } else {
        // El usuario canceló el inicio de sesión con Google
        Get.snackbar('Error', 'Google authentication canceled');
      }
    } catch (error) {
      print('Error $error');
      // Ocurrió un error durante el inicio de sesión con Google
      getSnackbar('Error', 'An error occurred during Google authentication');
      // Get.snackbar('Error', 'An error occurred during Google authentication');
    }
  }

  void getSnackbar(String tipe, String message) {
    Get.snackbar(
      tipe,
      message,
      backgroundColor: Colors.red, // Color de fondo del Snackbar
      colorText: Colors.white, // Color del texto del Snackbar
      duration: const Duration(seconds: 5), // Duración del Snackbar
      snackPosition: SnackPosition.TOP, // Posición del Snackbar en la pantalla
      borderRadius: 10, // Radio de borde del Snackbar
      margin: const EdgeInsets.all(10), // Márgenes del Snackbar
      padding: const EdgeInsets.all(15), // Espacio interno del Snackbar
      shouldIconPulse:
          true, // Animación pulsante del icono de cierre del Snackbar
      icon: const Icon(Icons.error), // Icono del Snackbar
      mainButton: TextButton(
        onPressed: () {
          Get.back();
        },
        child: const Text(
          'Dismiss',
          style: TextStyle(color: Colors.white),
        ),
      ), // Botón de acción adicional en el Snackbar
    );
  }
}
