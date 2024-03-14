import 'package:cleanserv/pages/register/register_controller.dart';
import 'package:cleanserv/widgets/image_header_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:cleanserv/common/theme_helper.dart';
// import 'package:email_validator/email_validator.dart';

// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
// import 'package:hexcolor/hexcolor.dart';

// import '../dashboard/profile_page.dart';

class RegistrationPage extends GetWidget<RegisterController> {
  RegistrationPage({super.key});

  // final _formKey = GlobalKey<FormState>();
  final RxBool checkboxValue = false.obs;

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
                    const SizedBox(height: 94),
                    const Text(
                      'Sign up',
                      style: TextStyle(
                        color: Color(0xFF151E33),
                        fontSize: 40,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w800,
                        height: 0.03,
                        letterSpacing: -1.40,
                      ),
                    ),
                    const SizedBox(height: 40),
                    Form(
                      key: controller.registerFormKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Column(
                        children: <Widget>[
                          RegisterEmailInput(controller: controller),
                          const SizedBox(height: 20),
                          RegisterPasswordInput(controller: controller),
                          const SizedBox(height: 20),
                          const SizedBox(height: 40),
                          RegisterButton(controller: controller),
                          const SizedBox(height: 20),
                          Text.rich(
                            TextSpan(
                              children: [
                                const TextSpan(
                                  text: "If you have an account, you can ",
                                  style: TextStyle(
                                    color: Color(0x7F151E33),
                                    fontSize: 16,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Log in.',
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Get.back();
                                    },
                                  style: const TextStyle(
                                    color: Color(0xFF151E33),
                                    fontSize: 16,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w900,
                                    height: 0,
                                  ),
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
            ),
          ),
        ],
      ),
    );
  }
  // Widget build(BuildContext context) {
  //   // double headerHeight = 250;
  //   return Scaffold(
  //       backgroundColor: Colors.white,
  //       body: Center(
  //         child: SingleChildScrollView(
  //           child: Column(
  //             children: [
  //               // SizedBox(
  //               //   height: headerHeight,
  //               //   child: HeaderWidget(headerHeight, true, Icons.password_rounded,
  //               //       'Register account'),
  //               // ),
  //               const Text(
  //                 'NickyServices',
  //                 style: TextStyle(
  //                     fontSize: 35,
  //                     fontWeight: FontWeight.bold,
  //                     color: Colors.black54),
  //               ),
  //               const Text(
  //                 'Register Account',
  //                 style: TextStyle(color: Colors.grey),
  //               ),
  //               SafeArea(
  //                 child: Container(
  //                   margin: const EdgeInsets.fromLTRB(25, 10, 25, 10),
  //                   padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
  //                   child: Column(
  //                     mainAxisAlignment: MainAxisAlignment.center,
  //                     children: [
  //                       Container(
  //                         alignment: Alignment.topLeft,
  //                         margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
  //                         child: Column(
  //                           mainAxisAlignment: MainAxisAlignment.start,
  //                           crossAxisAlignment: CrossAxisAlignment.start,
  //                         ),
  //                       ),
  //                       // const SizedBox(height: 10.0),
  //                       Form(
  //                         key: controller.registerFormKey,
  //                         autovalidateMode: AutovalidateMode.onUserInteraction,
  //                         child: Column(
  //                           children: <Widget>[
  //                             RegisterEmailInput(controller: controller),
  //                             const SizedBox(height: 30.0),
  //                             RegisterPasswordInput(controller: controller),
  //                             const SizedBox(height: 30.0),
  //                             AgreeTerms(controller: controller),
  //                             const SizedBox(height: 5.0),
  //                             Obx(() {
  //                               if (controller.isSubmitted.value &&
  //                                   !controller.checkboxValue.value) {
  //                                 return Container(
  //                                   alignment: Alignment.centerLeft,
  //                                   margin:
  //                                       const EdgeInsets.fromLTRB(20, 0, 20, 0),
  //                                   child: const Padding(
  //                                     padding: EdgeInsets.only(right: 20.0),
  //                                     child: Text(
  //                                       'Please accept the terms and conditions',
  //                                       textAlign: TextAlign.left,
  //                                       style: TextStyle(
  //                                         color: Colors.red,
  //                                         fontSize: 12.0,
  //                                       ),
  //                                     ),
  //                                   ),
  //                                 );
  //                               } else {
  //                                 return const SizedBox.shrink();
  //                               }
  //                             }),

  //                             const SizedBox(height: 50.0),
  //                             RegisterButton(controller: controller),
  //                             const SizedBox(height: 40.0),
  //                             Text.rich(
  //                               TextSpan(
  //                                 children: [
  //                                   const TextSpan(
  //                                       text:
  //                                           "Do you already have an account? "),
  //                                   TextSpan(
  //                                     text: 'Login',
  //                                     recognizer: TapGestureRecognizer()
  //                                       ..onTap = () {
  //                                         Get.back();
  //                                       },
  //                                     style: TextStyle(
  //                                         fontWeight: FontWeight.bold,
  //                                         color:
  //                                             Theme.of(context).primaryColor),
  //                                   ),
  //                                 ],
  //                               ),
  //                             ),
  //                           ],
  //                         ),
  //                       )
  //                     ],
  //                   ),
  //                 ),
  //               )
  //             ],
  //           ),
  //         ),
  //       ));
  // }
}

class AgreeTerms extends GetWidget<RegisterController> {
  const AgreeTerms({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  final RegisterController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20.0,
      child: Row(
        children: [
          Obx(() {
            return Checkbox(
              value: controller.checkboxValue.value,
              onChanged: (value) {
                controller.updateCheckboxValue(value!);
              },
            );
          }),
          // const SizedBox(width: 2.0),
          GestureDetector(
              onTap: () {
                controller.checkboxValue.toggle();
              },
              child: const Text(
                'I agree to the terms and conditions',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              )),
        ],
      ),
    );
  }
}

class RegisterEmailInput extends GetWidget<RegisterController> {
  const RegisterEmailInput({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  final RegisterController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ThemeHelper().inputBoxDecorationShaddow(),
      child: TextFormField(
        decoration:
            ThemeHelper().textInputDecoration("Email", "Enter your email"),
        validator: (value) {
          if (value!.isEmpty || !value.isEmail) {
            return 'Enter a valid email address';
          }
          if (value.length < 6) {
            return "Password must be at least 6 characters long";
          }
          return null;
        },
        controller: controller.registeremailController,
      ),
    );
  }
}

class RegisterPasswordInput extends GetWidget<RegisterController> {
  const RegisterPasswordInput({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  final RegisterController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ThemeHelper().inputBoxDecorationShaddow(),
      child: TextFormField(
        decoration: ThemeHelper()
            .textInputDecoration("Password", "Enter your password"),
        obscureText: true,
        validator: (val) {
          if ((val!.isNotEmpty) && (val.length < 6)) {
            return "Password must be at least 6 characters long";
          }
          return null;
        },
        controller: controller.registerpasswordController,
      ),
    );
  }
}

class RegisterButton extends GetWidget<RegisterController> {
  const RegisterButton({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  final RegisterController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55.0,
      width: double.infinity,
      child: GestureDetector(
        onTap: () async {
          if (!controller.isLoading.value) {
            await controller.onRegister();
          }
        },
        child: Container(
          padding: const EdgeInsets.only(right: 5),
          decoration: ShapeDecoration(
            color: const Color(0xFFF4F9FF),
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
                                color: Color(0xFF151E33),
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
                              'Sign up',
                              style: TextStyle(
                                color: Color(0xFF151E33),
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
                          color: Color(0xFF5926A6),
                          shape: BoxShape.circle,
                        ),
                      ),
                      const Positioned.fill(
                        child: Align(
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.arrow_forward,
                            color: Color(0xFFF4F9FF),
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
    // return SizedBox(
    //   width: double.infinity,
    //   // decoration: ThemeHelper().buttonBoxDecoration(context),
    //   height: 48.0,
    //   child: ElevatedButton(
    //     // style: ThemeHelper().buttonStyle(),
    //     // onPressed: () {  },
    //     style: ElevatedButton.styleFrom(
    //       backgroundColor: Theme.of(context).primaryColor,
    //       shape: RoundedRectangleBorder(
    //         borderRadius: BorderRadius.circular(
    //             25.0), // Ajusta el valor según tus preferencias
    //       ),
    //     ),
    //     child: Padding(
    //       padding: const EdgeInsets.fromLTRB(100, 10, 100, 10),
    //       child: Obx(() => controller.isLoading.value
    //           ? const SizedBox(
    //               width: 30,
    //               height: 30,
    //               child: CircularProgressIndicator(
    //                 strokeWidth: 3,
    //                 color: Colors.white,
    //               ),
    //             )
    //           : const Text(
    //               'Register',
    //               style: TextStyle(
    //                   fontSize: 20,
    //                   fontWeight: FontWeight.bold,
    //                   color: Colors.white),
    //             )),
    //     ),
    //     onPressed: () async {
    //       if (!controller.isLoading.value) {
    //         // controller.showLoading();
    //         controller.setSubmitted();
    //         await controller.onRegister();
    //       }
    //     },
    //   ),
    // );
  }
}
