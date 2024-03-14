import 'package:cleanserv/widgets/image_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const ImageHeader(),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: 410,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(41, 0, 41, 50),
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
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Welcome',
                          style: TextStyle(
                            color: Color(0x7F151E32),
                            fontSize: 64,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w800,
                            height: 0.02,
                            letterSpacing: -2.24,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'Nicky',
                          style: TextStyle(
                            color: Color(0x7F151E32),
                            fontSize: 64,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w800,
                            height: 1.2,
                            letterSpacing: -2.24,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'Everything you need in one \nplace',
                          style: TextStyle(
                            color: Color(0xFF151E33),
                            fontSize: 20,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w600,
                            height: 1.2,
                          ),
                        ),
                        const SizedBox(height: 40),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.toNamed('/register');
                              },
                              child: const Text(
                                'Sign up',
                                style: TextStyle(
                                  color: Color(0xFF151E33),
                                  fontSize: 20,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            const SizedBox(width: 44),
                            SizedBox(
                              height: 50,
                              width: 142,
                              child: GestureDetector(
                                onTap: () {
                                  Get.toNamed('/login');
                                },
                                child: Container(
                                  // height: 50,
                                  // width: 142,
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 5, 0),
                                  decoration: ShapeDecoration(
                                    color: const Color.fromARGB(
                                        255, 236, 239, 243),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Text(
                                        'Log in',
                                        style: TextStyle(
                                          color: Color(0xFF151E33),
                                          fontSize: 16,
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w700,
                                          letterSpacing: -0.56,
                                        ),
                                      ),
                                      const SizedBox(width: 15),
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
                            ),
                          ],
                        ),
                      ],
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
