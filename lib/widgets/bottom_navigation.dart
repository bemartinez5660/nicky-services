import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation(
      {super.key,
      required this.nextFunction,
      required this.disabledBackButton,
      required this.disabledNextButton, required this.loadingNextButton});
  final Function nextFunction;
  final bool disabledBackButton;
  final bool disabledNextButton;
  final bool loadingNextButton;


  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

int selectedIndex = 0;

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    final width = screen.width;
    return Positioned(
        bottom: 1,
        child: Container(
          height: 80,
          width: width,
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
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                    onPressed: widget.disabledBackButton
                        ? null
                        : () {
                            Get.back();
                          },
                    child: const Text(
                      'Go Back',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400),
                    )),
                GestureDetector(
                  onTap: () => widget.disabledNextButton
                      ? null
                      : widget.nextFunction(),
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Center(
                            child: Container(
                              margin: const EdgeInsets.only(left: 11),
                              child: const Text(
                                'Next',
                                style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  color: Color(0xFF151E33),
                                  fontSize: 16,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w700,
                                  // letterSpacing: -0.56,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        widget.loadingNextButton
                            ? const Padding(
                                padding: EdgeInsets.all(4.0),
                                child: CircularProgressIndicator(),
                              )
                            : Expanded(
                                flex: 1,
                                child: Stack(
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
                              ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
