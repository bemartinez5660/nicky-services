// ignore_for_file: unused_import, file_names

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:cleanserv/common/theme_helper.dart';
import 'package:get/get.dart';

import 'forgot_controller.dart';
import 'forgot_verification_page.dart';
// import '../login_page.dart';
import '../../widgets/header_widget.dart';

class ForgotPasswordPage extends GetWidget<ForgotController> {
  ForgotPasswordPage({Key? key}) : super(key: key);

  // final _formKey = GlobalKey<FormState>();
  // final ForgotController Controller;
  final ForgotController forgotController = Get.put(ForgotController());

  @override
  Widget build(BuildContext context) {
    // double headerHeight = 250;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // SizedBox(
                //   height: headerHeight,
                //   child: HeaderWidget(headerHeight, true, Icons.password_rounded,
                //       'Forgot Password'),
                // ),
                const Text(
                  'NickyServices',
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54),
                ),
                const Text(
                  'Forgot Password',
                  style: TextStyle(color: Colors.grey),
                ),
                SafeArea(
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(10, 0, 20, 0),
                    margin: const EdgeInsets.fromLTRB(20, 0, 10, 0),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          // margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              // Text(
                              //   'Forgot Password?',
                              //   style: TextStyle(
                              //       fontSize: 35,
                              //       fontWeight: FontWeight.bold,
                              //       color: Colors.black54),
                              //   // textAlign: TextAlign.center,
                              // ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Enter the email address associated with your account.',
                                style: TextStyle(
                                    // fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54),
                                // textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'We will email you a verification code to check your authenticity.',
                                style: TextStyle(
                                  color: Colors.black38,
                                  // fontSize: 20,
                                ),
                                // textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 40.0),
                        Form(
                          key: controller.forgotFormKey,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: Column(
                            children: <Widget>[
                              EmailInput(forgotController: forgotController),
                              const SizedBox(height: 40.0),
                              ForgotEmailButton(
                                controller: controller,
                              ),
                              const SizedBox(height: 30.0),
                              Text.rich(
                                TextSpan(
                                  children: [
                                    const TextSpan(
                                        text: "Remember your password? "),
                                    TextSpan(
                                      text: 'Login',
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Get.back();
                                          // Get.offAll('/login');
                                        },
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Theme.of(context).primaryColor),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

class ForgotEmailButton extends StatelessWidget {
  const ForgotEmailButton({Key? key, required this.controller})
      : super(key: key);

  final ForgotController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      // decoration: ThemeHelper().buttonBoxDecoration(context),
      child: ElevatedButton(
        // style: ThemeHelper().buttonStyle(),
        // onPressed: () {  },
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                25.0), // Ajusta el valor según tus preferencias
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(100, 10, 100, 10),
          child: Obx(() => controller.isLoading.value
              ? const SizedBox(
                  width: 30,
                  height: 30,
                  child: CircularProgressIndicator(
                    strokeWidth: 3,
                    color: Colors.white,
                  ),
                )
              : const Text(
                  'Send',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
        ),
        // onPressed: () =>
        //     loginController.onLogin(context),
        onPressed: () async {
          if (!controller.isLoading.value) {
            // controller.showLoading();
            await controller.onForgot();
          }
        },
      ),
    );
  }
}

class EmailInput extends StatelessWidget {
  const EmailInput({
    Key? key,
    required this.forgotController,
  }) : super(key: key);

  final ForgotController forgotController;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ThemeHelper().inputBoxDecorationShaddow(),
      child: TextFormField(
        decoration:
            ThemeHelper().textInputDecoration('Email', 'Enter your email'),
        keyboardType: TextInputType.emailAddress,
        // controller: loginController.emailController,
        validator: (value) {
          if (value!.isEmpty || !value.isEmail) {
            return 'Enter a valid email address';
          }
          return null;
        },
        controller: forgotController.forgotemailController,
        // initialValue: 'devhj2000@gmail.com',
        // onChanged: (value) {
        //   loginController.emailController.text = value;
        //   // loginController.loginData.update((val) => val!.email = value),
        // }
      ),
    );
  }
}
