// import 'package:cleanserv/environment.dart';
// import 'package:cleanserv/pages/dashboard/dashboard_controller.dart';
import 'package:cleanserv/pages/stepper/stepper_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
// import 'package:graphql_flutter/graphql_flutter.dart';

// class StepperPage extends GetWidget<StepperController> {
//   const StepperPage({super.key});

//   final steps = const [
//     Step(
//       title: Text('Step 1'),
//       content: Text('This is step 1'),
//     ),
//     Step(
//       title: Text('Step 2'),
//       content: Text('This is step 2'),
//     ),
//     Step(
//       title: Text('Step 3'),
//       content: Text('This is step 3'),
//     ),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     // FlutterStatusbarcolor.setStatusBarColor(Colors.transparent);
//     // FlutterStatusbarcolor.setNavigationBarColor(Colors.transparent);
//     // FlutterStatusbarcolor.setStatusBarWhiteForeground(false);
//     SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
//       statusBarColor: Colors.transparent,
//       // systemNavigationBarColor: Colors.transparent,
//       statusBarIconBrightness: Brightness.dark,
//     ));
//     return Scaffold(
//       // persistentFooterAlignment: AlignmentDirectional.centerEnd,
//       // bottomNavigationBar: null,
//       extendBody: true,

//       body: GetBuilder<StepperController>(
//         init: StepperController(), // Inicializa el controlador del Stepper
//         builder: (controller) {
//           return Stepper(
//             type: StepperType.horizontal,
//             currentStep: controller.currentStep
//                 .value, // Utiliza el valor del controlador para el paso actual
//             onStepContinue: () {
//               if (controller.currentStep.value < steps.length - 1) {
//                 controller.currentStep.value++; // Incrementa el paso actual
//               } else {
//                 Get.back(); // Regresa a la página anterior
//               }
//             },
//             onStepCancel: () {
//               if (controller.currentStep.value > 0) {
//                 controller.currentStep.value--; // Decrementa el paso actual
//               } else {
//                 Get.back(); // Regresa a la página anterior
//               }
//             },
//             steps: steps,
//           );
//         },
//       ),
//       // const SettingsPage(),
//       bottomNavigationBar: Container(
//         height: 80,
//         decoration: ShapeDecoration(
//           color: Colors.white.withOpacity(0.9),
//           shape: const RoundedRectangleBorder(
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(30),
//               topRight: Radius.circular(30),
//             ),
//           ),
//           shadows: const [
//             BoxShadow(
//               color: Color(0x19000000),
//               blurRadius: 70,
//               offset: Offset(0, -10),
//               spreadRadius: 0,
//             ),
//           ],
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             Row(
//               children: [
//                 GestureDetector(
//                   onTap: () {
//                     // Get.toNamed('/register');
//                     Get.back();
//                   },
//                   child: const Text(
//                     'Go Back',
//                     style: TextStyle(
//                       color: Color(0xFF151E33),
//                       fontSize: 20,
//                       fontFamily: 'Roboto',
//                       fontWeight: FontWeight.w400,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 44),
//                 SizedBox(
//                   height: 50,
//                   width: 142,
//                   child: GestureDetector(
//                     onTap: () {
//                       // Get.toNamed('/login');
//                     },
//                     child: Container(
//                       // height: 50,
//                       // width: 142,
//                       padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
//                       decoration: ShapeDecoration(
//                         color: const Color(0xFFF4F9FF),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(30),
//                         ),
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           const Text(
//                             'Next',
//                             style: TextStyle(
//                               color: Color(0xFF151E33),
//                               fontSize: 16,
//                               fontFamily: 'Roboto',
//                               fontWeight: FontWeight.w700,
//                               letterSpacing: -0.56,
//                             ),
//                           ),
//                           const SizedBox(width: 15),
//                           Stack(
//                             children: [
//                               Container(
//                                 width: 40,
//                                 height: 40,
//                                 decoration: const BoxDecoration(
//                                   color: Color(0xFF5926A6),
//                                   shape: BoxShape.circle,
//                                 ),
//                               ),
//                               const Positioned.fill(
//                                 child: Align(
//                                   alignment: Alignment.center,
//                                   child: Icon(
//                                     Icons.arrow_forward,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
class StepperPage extends GetWidget<StepperController> {
  StepperPage({Key? key}) : super(key: key);

  final List<Widget> pages = [
    // const HowOftenCleaned(),
    // const HistoryPage(),
    // const SettingsPage(),
  ];

  final steps = const [
    {
      "title": 'How often do you want the house cleaned?',
      "content": ['Just once', 'Every week', 'Every 2 week', 'Once a month'],
    },
    {
      "title": 'How many bedrooms are there?',
      "content": [
        '1 bedroom',
        '2 bedroom',
        '3 bedroom',
        '4 bedroom',
        '5 bedroom',
        '6 bedroom'
      ],
    },
    {
      "title": 'What kind of cleaning do you need?',
      "content": ['Standard cleaning', 'Deep cleaning', 'Move Out cleaning'],
    },
    {
      "title": 'How many bathrooms does the house have?',
      "content": [
        '1 Bedroom',
        '2 Bedroom',
        '3 Bedroom',
        '4 Bedroom',
        '5 Bedroom',
        '6 Bedroom'
      ],
    },
    {
      "title": 'Any pets in the house?',
      "content": ['No pets in home', 'Pets in home'],
    },
    {
      "title": 'Is there anything else you need?',
      "content": [
        'Window cleaning (interior)',
        'Fridge cleaning',
        'Oven cleaning',
        'Laundry'
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    // Generar los radios dinámicamente

    // List<Widget> radioList = [];
    // List<String> radioOptions =
    //     (steps[controller.currentStep.value]["content"] as List<dynamic>)
    //         .cast<String>();
    // for (int i = 0; i < radioOptions.length; i++) {
    //   radioList.add(
    //     Row(
    //       children: [
    //         Radio<int>(
    //           value: i + 1,
    //           groupValue: controller.selectedRadio.value,
    //           onChanged: (int? value) {
    //             controller.selectedRadio.value = value!;
    //           },
    //         ),
    //         Text(
    //           radioOptions[i],
    //           style: const TextStyle(
    //             fontSize: 16,
    //             fontWeight: FontWeight.w500,
    //           ),
    //         ),
    //       ],
    //     ),
    //   );
    // }
    return Scaffold(
      extendBody: true,
      // appBar: AppBar(
      //   title:
      //       Obx(() => Text(steps[controller.currentStep.value]["title"] ?? '')),
      // ),
      body: GetBuilder<StepperController>(
        init: StepperController(),
        builder: (controller) {
          return Obx(() {
            // Generar los radios dinámicamente
            List<Widget> radioList = [];
            List<String> radioOptions = (steps[controller.currentStep.value]
                    ["content"] as List<dynamic>)
                .cast<String>();
            for (int i = 0; i < radioOptions.length; i++) {
              radioList.add(
                Row(
                  children: [
                    Radio<int>(
                      value: i + 1,
                      groupValue: controller.selectedRadio.value,
                      onChanged: (int? value) {
                        controller.selectedRadio.value = value!;
                      },
                    ),
                    Text(
                      radioOptions[i],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              );
            }
            return Column(
              children: [
                // const SizedBox(height: 80),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(41, 80, 41, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Obx(() => Text(
                              steps[controller.currentStep.value]["title"]
                                  as String,
                              // Obx(() => Text(steps[controller.currentStep.value]["title"] ?? '')),
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Color(0xCC151E32),
                                fontSize: 24,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w800,
                                height:
                                    1.2, // Ajusta el valor de altura según tus necesidades
                                letterSpacing: -0.84,
                              ),
                            )),
                        const SizedBox(height: 16),
                        Column(
                          children: radioList,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 80,
                  decoration: ShapeDecoration(
                    color: Colors.white.withOpacity(0.9),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    shadows: const [
                      BoxShadow(
                        color: Color(0x19000000),
                        blurRadius: 70,
                        offset: Offset(0, -10),
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (controller.currentStep.value > 0) {
                            controller.currentStep.value--;
                          } else {
                            Get.back();
                          }
                        },
                        child: const Text(
                          'Go Back',
                          style: TextStyle(
                            color: Color(0xFF151E33),
                            fontSize: 20,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 44.0,
                      ),
                      GestureDetector(
                        onTap: () {
                          if (controller.currentStep.value < steps.length - 1) {
                            controller.currentStep.value++;
                          }
                          // print(controller.currentStep.value);
                        },
                        child: Container(
                          height: 50.0,
                          width: 142.0,
                          padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                          decoration: ShapeDecoration(
                            color: const Color.fromARGB(255, 225, 229, 234),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                'Next',
                                style: TextStyle(
                                  color: Color(0xFF151E33),
                                  fontSize: 16,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: -0.56,
                                ),
                              ),
                              const SizedBox(width: 29),
                              Stack(
                                children: [
                                  Container(
                                    width: 40,
                                    height: 40,
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
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          });
        },
      ),
    );
  }
}

class StepContent extends GetWidget<StepperController> {
  const StepContent({
    Key? key,
    required this.steps,
  }) : super(key: key);

  final List<Map<String, String>> steps;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child:
          Obx(() => Text(steps[controller.currentStep.value]["title"] ?? '')),
    );
  }
}

// Widget _buildStep1Content() {
//   return Column(
//     children: const [
//       CustomButton(text: 'Button 1'),
//       CustomButton(text: 'Button 2'),
//       CustomButton(text: 'Button 3'),
//       CustomButton(text: 'Button 4'),
//     ],
//   );
// }

class CustomButton extends StatelessWidget {
  final String text;

  const CustomButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        GestureDetector(
          onTap: () {},
          child: Container(
            height: 50.0,
            width: 142.0,
            padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
            decoration: ShapeDecoration(
              color: const Color.fromARGB(255, 225, 229, 234),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  text,
                  style: const TextStyle(
                    color: Color(0xFF151E33),
                    fontSize: 16,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.56,
                  ),
                ),
                const SizedBox(width: 29),
                Stack(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 166, 162, 172),
                        shape: BoxShape.circle,
                      ),
                    ),
                    const Positioned.fill(
                      child: Align(
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}

// class HistoryPage extends StatelessWidget {
//   const HistoryPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Center(
//       child: Text('History Page'),
//     );
//   }
// }

// class SettingsPage extends GetWidget<DashboardController> {
//   const SettingsPage({Key? key}) : super(key: key);

//   // final DashboardController controller;

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Container(
//         alignment: Alignment.center,
//         padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
//         child: Column(
//           children: [
//             Container(
//               padding: const EdgeInsets.all(10),
//               child: Stack(
//                 alignment: Alignment.bottomRight,
//                 children: [
//                   Icon(
//                     Icons.person_pin,
//                     size: 70,
//                     color: Colors.grey.shade300,
//                   ),
//                   const Icon(
//                     Icons.edit,
//                     size: 20,
//                     color: Colors.black,
//                   ),
//                 ],
//               ),
//             ),
//             const Text(
//               'Alfredo Blanco',
//               style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             Expanded(
//               child: ListView.separated(
//                 separatorBuilder: (context, index) => const Divider(
//                   color: Colors.grey,
//                 ),
//                 itemCount: 10,
//                 itemBuilder: (context, index) {
//                   String title;

//                   switch (index) {
//                     case 0:
//                       title = 'Account';
//                       break;
//                     case 1:
//                       title = 'Notifications';
//                       break;
//                     case 2:
//                       title = 'Refer a friend, get 50% off';
//                       break;
//                     case 3:
//                       title = 'Help';
//                       break;
//                     case 4:
//                       title = 'Privacy Policy';
//                       break;
//                     case 5:
//                       title = 'CA Notice At Collection';
//                       break;
//                     case 6:
//                       title = 'Terms Of Use';
//                       break;
//                     case 7:
//                       title = 'Acknowledgements';
//                       break;
//                     case 8:
//                       title = 'Report A Technical Problem';
//                       break;
//                     case 9:
//                       title = 'Log Out';
//                       break;
//                     default:
//                       title = '';
//                   }

//                   return Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       ListTile(
//                         title: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Expanded(
//                               child: Text(
//                                 title,
//                                 textAlign: TextAlign.left,
//                               ),
//                             ),
//                           ],
//                         ),
//                         trailing: const Icon(
//                           Icons.arrow_forward_ios,
//                           color: Colors.black,
//                         ),
//                         onTap: () {
//                           print('Tapped item at index $index');
//                           if (index == 9) {
//                             // controller.exitApp(context);
//                             controller.confirmLogout(context);
//                           }
//                         },
//                       ),
//                     ],
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
