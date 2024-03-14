import 'dart:ui';

import 'package:cleanserv/widgets/image_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllReadyPage extends StatelessWidget {
  const AllReadyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    final width = screen.width;
    final heigth = screen.height;
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  Colors.white.withOpacity(
                      0.7), // Ajusta la opacidad según tus necesidades
                  BlendMode.srcATop,
                ),
                child: const ImageHeader(),
              ),
            ),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
              child: Container(
                color: Colors.white.withOpacity(0.75),
              ),
            ),
            SafeArea(
                child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: heigth * 0.1,
                  ),
                  Opacity(
                    opacity: 0.20,
                    child: Container(
                      width: 120.56,
                      height: 99.41,
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(),
                      child: Stack(
                        children: [
                          Positioned(
                            child: SizedBox(
                              width: 120.57,
                              height: 99.42,
                              child: Stack(children: [
                                Image.asset('assets/images/clock_image.png'),
                              ]),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  const Text(
                    'All ready',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromRGBO(21, 30, 50, 0.7),
                      fontSize: 48,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w800,
                      height: 0.02,
                      letterSpacing: -1.68,
                    ),
                  ),
                  const SizedBox(height: 50),
                  SizedBox(
                    width: width * 0.8,
                    child: const Text(
                      'One of our experienced cleaning specialists will be in touch to schedule an appointment for your estimate at your convenience. During the appointment, they will walk through your facility with you to assess your cleaning needs and provide you with a customized estimate.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF151E33),
                        fontSize: 14,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed('/dashboard');
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 163,
                          height: 50,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 163,
                                  height: 50,
                                  decoration: ShapeDecoration(
                                    color: const Color(0xFFF4F9FF),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 13,
                                top: 5,
                                child: SizedBox(
                                  width: 145,
                                  height: 40,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Text(
                                        'Back to Home',
                                        style: TextStyle(
                                          color: Color(0xFF151E33),
                                          fontSize: 16,
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w700,
                                          height: 0,
                                          letterSpacing: -0.56,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      SizedBox(
                                        width: 40,
                                        height: 40,
                                        child: Stack(
                                          children: [
                                            Positioned(
                                              left: 0,
                                              top: 0,
                                              child: Container(
                                                width: 40,
                                                height: 40,
                                                decoration:
                                                    const ShapeDecoration(
                                                  color: Color(0xFF5926A6),
                                                  shape: OvalBorder(),
                                                ),
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
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
