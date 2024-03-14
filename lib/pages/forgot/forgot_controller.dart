import 'package:cleanserv/common/theme_helper.dart';
import 'package:cleanserv/environment.dart';
// import 'package:cleanserv/services/console.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:cleanserv/graphql_strings.dart' as gql_str;

class ForgotController extends GetxController {
  late GraphQLClient _client;
  RxBool isLoading = false.obs;
  GlobalKey<FormState> forgotFormKey = GlobalKey<FormState>();
  final _error = Rxn<String>();
  final forgotemailController = TextEditingController();

  String? get error => _error.value;

  @override
  void onInit() async {
    _client = GraphQLClient(
      cache: GraphQLCache(),
      link: HttpLink(Environment.endpoint),
    );

    super.onInit();
  }

  void showLoading() {
    isLoading.value = true;
  }

  void hideLoading() {
    isLoading.value = false;
  }

  void showMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.red[400],
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  onForgot() async {
    // Establecer el foco en el edit del email
    // emailFocus.requestFocus();
    // ...
    if (forgotFormKey.currentState!.validate()) {
      _error.value = null;
      try {
        isLoading.value = true;
        QueryResult result = await _client
            .mutate(
              MutationOptions(
                fetchPolicy: FetchPolicy.networkOnly,
                document: gql(gql_str.forgotpassword),
                variables: {'email': forgotemailController.text},
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
          final sendPasswordResetEmail = result.data!['sendPasswordResetEmail'];
          if (sendPasswordResetEmail != null) {
            final success = sendPasswordResetEmail['success'];
            if (success != null && success) {
              showSuccessDialog();
            } else {
              final errors = sendPasswordResetEmail['errors'];
              if (errors != null && errors.isNotEmpty) {
                final errorMessage = errors[0].message;
                showMessage(errorMessage);
              } else {
                showMessage('An error occurred while processing your request');
              }
            }
          } else {
            showMessage('Invalid response');
          }
        }
      } catch (e) {
        isLoading.value = false;
        showMessage('Error mio: $e');
      }
    }
  }

//   void showSuccessDialog() {
//     showDialog(
//       context: Get.context!,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Success'),
//           content: const Text('Password reset email sent successfully.'),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Get.offNamed('/login');
//               },
//               child: const Text('OK'),
//             ),
//           ],
//         );
//       },
//     );
//   }
  void showSuccessDialog() {
    const title = 'Success';
    const content = 'Password reset email sent successfully.';
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
      // Get.toNamed('/login');
    });
  }

  // AlertDialog alertDialog(String title, String content, BuildContext context) {
  //   return AlertDialog(
  //     title: Text(title),
  //     content: Text(content),
  //     actions: [
  //       TextButton(
  //         style: ButtonStyle(
  //           backgroundColor: MaterialStateProperty.all(Colors.black38),
  //         ),
  //         onPressed: () {
  //           Navigator.of(context).pop();
  //         },
  //         child: const Text(
  //           'OK',
  //           style: TextStyle(color: Colors.white),
  //         ),
  //       ),
  //     ],
  //   );
  // }
}
