
// ignore_for_file: avoid_print

import 'package:cleanserv/common/theme_helper.dart';
import 'package:cleanserv/environment.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:cleanserv/graphql_strings.dart' as gql_str;

class RegisterController extends GetxController {
  var email = ''.obs;
  var password = ''.obs;
  RxBool checkboxValue = false.obs;
  var isChecked = false.obs;
  var isSubmitted = false.obs;

  late GraphQLClient _client;
  RxBool isLoading = false.obs;
  GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  final _error = Rxn<String>();
  final registeremailController = TextEditingController();
  final registerpasswordController = TextEditingController();
  // final checkboxvalidate =

  String? get error => _error.value;

  void updateCheckboxValue(bool value) {
    checkboxValue.value = value;
    isChecked.value = value;
    update();
  }

  void setSubmitted() {
    isSubmitted.value = true;
  }

  onRegister() async {
    // Aquí se puede implementar la lógica de registro, por ejemplo, enviar los datos al servidor.
    // print('Registro exitoso:  $email,  $password');
    // if (!checkboxValue.value) {
    //   showMessage('Accept terms and condition first');
    //   return;
    // }
    if (registerFormKey.currentState!.validate() && checkboxValue.value) {
      _error.value = null;
      try {
        isLoading.value = true;
        QueryResult result = await _client
            .mutate(
              MutationOptions(
                fetchPolicy: FetchPolicy.networkOnly,
                document: gql(gql_str.register),
                variables: {
                  'email': registeremailController.text,
                  'password1': registerpasswordController.text,
                  // 'username': registeremailController.text,
                  // 'password2': registerpasswordController.text
                },
                errorPolicy: ErrorPolicy.all,
              ),
            )
            .timeout(const Duration(seconds: 10));
        isLoading.value = false;
        if (result.hasException) {
          final error = result.exception!;
          if (error.graphqlErrors.isNotEmpty) {
            // final errorMessage = error.graphqlErrors[0].message;
            showMessage(result.exception!.graphqlErrors.first.message);
          } else {
            showMessage('Conextion not available, please repeat again');
          }
        } else {
          final register = result.data!['register'];
          if (register != null) {
            final success = register['success'];
            if (success != null && success) {
              showSuccessDialog();
            } else {
              if (result.data != null && result.data!['register'] != null) {
                final registerData = result.data!['register'];
                if (registerData['success'] == false &&
                    registerData['errors'] != null) {
                  final errors = registerData['errors'];
                  final firstField = errors.keys.first;
                  final firstError = errors[firstField][0];
                  final errorMessage = firstError['message'];
                  showMessage(errorMessage);
                }
              } else {
                showMessage('Data response null value');
              }
            }
          } else {
            showMessage('Invalid response');
          }
        }
        // if (result.data != null && result.data!['register'] != null) {
        //   final registerData = result.data!['register'];

        //   if (registerData['success'] && registerData['errors'] == null) {
        //     showSuccessDialog();
        //   } else {
        //     final errors = registerData['errors'];
        //     // Manejar los mensajes de error
        //     if (errors[0].message != null) {
        //       // Mostrar el mensaje de error y/o realizar acciones adicionales según sea necesario
        //       print('Error: $errors[0].message ');
        //     }
        //   }
        // }
        // final response = jsonDecode(result.toString());
        // stdout.write(response);
        // bool success = response['data']['register']['success'];
        // Map<String, dynamic> errors = response['data']['register']['errors'];
        // final success = result.data?.length;
        // showMessage(response);
        // final register =
        //     result.data != null ? result.data!['register']['success'] : null;
        // if (register != null) {
        //   final success = register['success'];
        //   if (success != null && success) {
        //     showSuccessDialog();
        //   } else {
        //     final errors = register['errors'];
        //     if (errors != null && errors.isEmpty) {
        //       final errorMessage = errors[0]['message'];
        //       showMessage(errorMessage);
        //     } else {
        //       showMessage('An error occurred while processing your request');
        //     }
        //   }
        // } else {
        //   showMessage('Invalid response');
        // }
        // final register = result.data!['register'][''];
        // if (register != null) {
        //   final success = register['success'];
        //   if (success != null && success) {
        //     showSuccessDialog();
        //   } else {
        //     final errors = register['errors'];
        //     if (errors != null && errors.isNotEmpty) {
        //       final errorMessage = errors[0].message;
        //       showMessage(errorMessage);
        //     } else {
        //       showMessage('An error occurred while processing your request');
        //     }
        //   }
        // } else {
        //   showMessage('Invalid response');
        // }
        // }
      } catch (e) {
        isLoading.value = false;
        showMessage('Error mio: $e');
        print('Error mio: $e');
      }
    }
  }

  @override
  void onInit() {
    _client = GraphQLClient(
      cache: GraphQLCache(),
      link: HttpLink(Environment.endpoint),
    );
    super.onInit();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
  void showLoading() {
    isLoading.value = true;
  }

  void hideLoading() {
    isLoading.value = false;
  }

  void showMessage(String message) async {
    // await Future.delayed(const Duration(seconds: 10));
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.red[400],
      textColor: Colors.white,
      fontSize: 16.0,
    );
    // Fluttertoast.showToast(
    //   msg: "Este es un mensaje toast demorado",
    //   toastLength: Toast.LENGTH_SHORT,
    //   gravity: ToastGravity.BOTTOM,
    //   backgroundColor: Colors.grey,
    //   textColor: Colors.white,
    // );

    // Future.delayed(const Duration(seconds: 15), () {
    //   Fluttertoast.cancel(); // Oculta el toast después de 3 segundos
    // });
  }

  void showSuccessDialog() {
    const title = 'Success';
    const content =
        'Successfully registered. Please, check your email and active your account.';
    final context = Get.context!;
    final ThemeHelper theme = ThemeHelper();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return theme.alertDialog(title, content, context);
      },
    ).then((_) {
      // Aquí puedes agregar cualquier acción adicional después de cerrar el diálogo de éxito, si es necesario.
      // Por ejemplo, redirigir al usuario a otra pantalla.
      // Get.offNamed('/login');
      Get.back();
    });
  }
}
