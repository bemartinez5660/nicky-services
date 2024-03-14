
import 'package:cleanserv/pages/login/login_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:cleanserv/common/theme_helper.dart';
import 'package:cleanserv/widgets/image_header_widget.dart';
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
    return Scaffold(
      body: Stack(
        children: [
          const ImageHeader(),
          Align(
            alignment: Alignment.bottomLeft,
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.fromLTRB(41, 40, 41, 40),
                decoration: ShapeDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.white.withOpacity(1.0),
                      Colors.white.withOpacity(1.0),
                    ],
                    stops: const [0.0, 0.1],
                  ),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  shadows: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      blurRadius: 70,
                      offset: const Offset(0, -10),
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 50),
                    const Text(
                      'Login',
                      style: TextStyle(
                        color: Color(0xFF151E32),
                        fontSize: 40,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w800,
                        height: 0.03,
                        letterSpacing: -1.40,
                      ),
                    ),
                    Form(
                      key: controller.loginFormKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Column(
                        children: const [
                          SizedBox(height: 40.0),
                          EmailAddressInput(),
                          SizedBox(height: 30.0),
                          PasswordInput(),
                          SizedBox(height: 20.0),
                          ForgotPassword(),
                          SizedBox(height: 20.0),
                          LoginButton(),
                          SizedBox(height: 5.0),
                          NotAccount(),
                          SizedBox(height: 5.0),
                          GoogleButton(),
                        ],
                      ),
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
      height: 50,
      child: ElevatedButton(
        onPressed: () => controller.loginWithGoogle(),
        style: ElevatedButton.styleFrom(
          // foregroundColor: Colors.black,
          backgroundColor: const Color(0x3FD4E0ED),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            // side: const BorderSide(color: Colors.grey, width: 0),
          ),
          elevation: 0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 50.0,
              width: 50.0,
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
              "Continue with Google",
              style: TextStyle(
                color: Color(0x66151E33),
                fontSize: 16,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w700,
                // height: 0,
                letterSpacing: -0.56,
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
      alignment: Alignment.center,
      child: Text.rich(TextSpan(children: [
        TextSpan(
          text: "Don't have an account? ",
          style: const TextStyle(
            color: Color(0xFF151E33),
            fontSize: 16,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w400,
            height: 0,
          ),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              Get.toNamed('/register');
            },
        ),
        TextSpan(
          text: 'Sign up',
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              Get.toNamed('/register');
            },
          style: const TextStyle(
            color: Color(0xFF151E33),
            fontSize: 16,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w900,
            height: 0,
          ),
        )
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
      height: 55.0,
      width: double.infinity,
      child: GestureDetector(
        onTap: () async {
          if (!controller.isLoading.value) {
            await controller.onLogin();
          }
        },
        child: Container(
          padding: const EdgeInsets.only(right: 5),
          decoration: ShapeDecoration(
            color: const Color(0xFF5926A6),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Obx(
                () => controller.isLoading.value
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(left: 36),
                            child: SizedBox(
                              width: 30,
                              height: 30,
                              child: CircularProgressIndicator(
                                strokeWidth: 3,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(left: 36),
                            child: Text(
                              'Log in',
                              style: TextStyle(
                                color: Color(0xFFD4E0ED),
                                fontSize: 16,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w700,
                                letterSpacing: -0.56,
                              ),
                            ),
                          ),
                        ],
                      ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Container(
                        width: 45,
                        height: 45,
                        decoration: const BoxDecoration(
                          color: Color(0xFFF4F9FF),
                          shape: BoxShape.circle,
                        ),
                      ),
                      const Positioned.fill(
                        child: Align(
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.arrow_forward,
                            color: Color(0xFF151E33),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
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
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: () {
          Get.toNamed('/forgot');
        },
        child: const Text(
          "I forgot my password",
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
    return TextFormField(
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
    return TextFormField(
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
    );
  }
}
