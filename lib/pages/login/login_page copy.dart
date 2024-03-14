// ignore_for_file: file_names, unnecessary_null_comparison

import 'package:cleanserv/pages/login/login_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:cleanserv/common/theme_helper.dart';
import 'package:get/get.dart';

class PasswordValidator {
  static final RegExp _passwordRegExp = RegExp(
    r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}$',
  );

  static isValid(String password) {
    return _passwordRegExp.hasMatch(password);
  }
}

class LoginPage extends GetWidget<LoginController> {
  const LoginPage({super.key});
  // final double _headerHeight = 250;
  // final Key FormKey = GlobalKey<FormState>();
  // final LoginController loginController = Get.put(LoginController());
  // static get control => null;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final result = await controller.exitApp(context);
        return (result != null) && result;
      },
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // SizedBox(
                    //   height: _headerHeight,
                    //   child: HeaderWidget(
                    //       _headerHeight,
                    //       true,
                    //       Icons.login_rounded,
                    //       'Signin into your account'), //let's create a common header widget
                    // ),
                    SafeArea(
                      child: Container(
                          padding: const EdgeInsets.fromLTRB(10, 0, 20, 10),
                          margin: const EdgeInsets.fromLTRB(
                              20, 0, 10, 20), // This will be the login form
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'NickyServices',
                                style: TextStyle(
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54),
                              ),
                              const Text(
                                'Signin into your account',
                                style: TextStyle(color: Colors.grey),
                              ),
                              const SizedBox(height: 5.0),
                              Form(
                                  key: controller.loginFormKey,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  child: Column(
                                    children: const [
                                      SizedBox(height: 30.0),
                                      EmailAddressInput(),
                                      SizedBox(height: 30.0),
                                      PasswordInput(),
                                      SizedBox(height: 20.0),
                                      ForgotPassword(),
                                      SizedBox(height: 20.0),
                                      LoginButton(),
                                      SizedBox(height: 5.0),
                                      NotAccount(),
                                      SizedBox(height: 20.0),
                                      GoogleButton(),
                                    ],
                                  )),
                            ],
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GoogleButton extends GetWidget<LoginController> {
  const GoogleButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: () => controller.loginWithGoogle(),
        style: ElevatedButton.styleFrom(
          // foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            side: const BorderSide(color: Colors.grey, width: 1),
          ),
          elevation: 0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 30.0,
              width: 30.0,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/googleimage.png'),
                  fit: BoxFit.cover,
                ),
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 20),
            const Text(
              "Sign In with Google",
              style: TextStyle(
                fontSize: 16,
                // fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NotAccount extends StatelessWidget {
  const NotAccount({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      //child: Text('Don\'t have an account? Create'),
      alignment: Alignment.topRight,
      child: Text.rich(TextSpan(children: [
        TextSpan(
          text: "Don't have an account? ",
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              Get.toNamed('/register');
            },
        ),
        TextSpan(
          text: 'Create',
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              Get.toNamed('/register');
            },
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor),
        ),
      ])),
    );
  }
}

class LoginButton extends GetWidget<LoginController> {
  const LoginButton({
    Key? key,
  }) : super(key: key);

  // final LoginController loginController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      // decoration: ThemeHelper().buttonBoxDecoration(context),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                25.0), // Ajusta el valor según tus preferencias
          ),
        ),
        // color: Theme.of(context).primaryColor,
        // style: ThemeHelper().buttonStyle(),
        // onPressed: () =>
        //     loginController.onLogin(context),
        onPressed: () async {
          if (!controller.isLoading.value) {
            // loginController.showLoading();
            await controller.onLogin();
          }
        },
        // onPressed: () {  },
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
                  'Login',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
        ),
      ),
    );
  }
}

class ForgotPassword extends GetWidget<LoginController> {
  const ForgotPassword({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 0, 10, 20),
      alignment: Alignment.topRight,
      child: GestureDetector(
        onTap: () {
          Get.toNamed('/forgot');
        },
        child: const Text(
          "Forgot your password?",
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}

class PasswordInput extends GetWidget<LoginController> {
  const PasswordInput({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ThemeHelper().inputBoxDecorationShaddow(),
      child: TextFormField(
        obscureText: true,
        decoration: ThemeHelper().textInputDecoration(
          'Password',
          'Enter your password',
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Enter your password';
          }
          if (value.length < 5) {
            return 'password must be at least 6 characters';
          }
          //Luego preguntar para poner una validacion de contraseña
          // if (!PasswordValidator.isValid(
          //     value)) {
          //   return 'Password must be 6 characters at least with one character and one number';
          //   //return 'La contraseña debe tener al menos 8 caracteres con al menos una letra y un número.';
          // }
          return null;
        },
        controller: controller.passwordController,
        // initialValue: 'Qq123456*',
        // onChanged: (value) {
        //   loginController.passwordController.text = value;
        //   // loginController.loginData.update((val) => val!.password = value),
        // }
      ),
    );
  }
}

class EmailAddressInput extends GetWidget<LoginController> {
  const EmailAddressInput({
    Key? key,
  }) : super(key: key);

  // final LoginController controller;

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
        controller: controller.emailController,
      ),
    );
  }
}
