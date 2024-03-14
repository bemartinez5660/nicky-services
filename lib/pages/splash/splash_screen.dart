// // ignore_for_file: unnecessary_new

// //import 'dart:async';
// //import 'package:cleanserv/pages/login/login_page.dart';
// import 'package:get/get.dart';
// import 'package:flutter/material.dart';
// // import 'package:curved_splash_screen/curved_splash_screen.dart';
// // import 'package:cleanserv/pages/splash/splash_controller.dart';
// //import 'package:shared_preferences/shared_preferences.dart';
// //import 'package:curved_splash_screen/curved_splash_screen.dart';

// class SplashScreen extends GetWidget<SplashController> {
//   const SplashScreen({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   Widget build(BuildContext context) {
//     return Builder(
//       builder: (context) => CurvedSplashScreen(
//           screensLength: splashContent.length,
//           screenBuilder: (index) {
//             return SplashContent(
//               title: splashContent[index]["title"] ?? "Sin titulo",
//               image: splashContent[index]["image"] ?? "",
//               text: splashContent[index]["text"] ?? "No text",
//             );
//           },
//           onSkipButton: () {
//             Get.toNamed('/login');
//             //Get.offAllNamed('/login');
//             //Get.off(LoginPage(), preventDuplicates: true);
//           }),
//     );
//   }
// }

// class SplashContent extends StatelessWidget {
//   final String title;
//   final String text;
//   final String image;

//   const SplashContent({
//     Key? key,
//     required this.title,
//     required this.text,
//     required this.image,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 15.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           const SizedBox(height: 100),
//           Container(
//             height: 200,
//             child: Image.asset(image),
//           ),
//           const SizedBox(height: 60),
//           Text(
//             title,
//             style: const TextStyle(
//               color: Colors.black,
//               fontSize: 27,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: 20),
//           Text(
//             text,
//             textAlign: TextAlign.center,
//             style: const TextStyle(
//               fontSize: 19,
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

// final splashContent = [
//   {
//     "title": "Start cleaning",
//     "text":
//         "Start cleaning now by using this app, Get your choosen option and start the journey.",
//     "image": "assets/images/1.png",
//   },
//   {
//     "title": "Explore Options",
//     "text": "Choose which clean service is suitable for you to enroll in.",
//     "image": "assets/images/2.png",
//   },
//   {
//     "title": "At Any time.",
//     "text":
//         "Your cleaner is here and available at any time you want. Join us now !",
//     "image": "assets/images/3.png"
//   },
// ];
