import 'package:flutter/material.dart';

class ProfileFormButton extends StatelessWidget {
  const ProfileFormButton(
      {super.key, required this.txt, required this.function});
  final String txt;
  final Function function;

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    final width = screen.width;
    return Column(
      children: [
        GestureDetector(
          onTap: () => function(),
          child: Container(
              width: width * 0.8,
              height: 40,
              decoration: ShapeDecoration(
                color: const Color.fromRGBO(76, 34, 141, 0.13),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: width * 0.65,
                      margin: const EdgeInsets.only(left: 20),
                      child: Text(
                        txt,
                        style: const TextStyle(
                          color: Color.fromRGBO(21, 30, 51, 0.7),
                          fontSize: 14,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                          letterSpacing: -0.56,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 30,
                    height: 30,
                    // padding: EdgeInsets.only(left: 10),
                    decoration: const ShapeDecoration(
                      color: Color.fromRGBO(21, 30, 51, 0.1),
                      shape: OvalBorder(),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: Image.asset(
                        "assets/images/black_arrow.png",
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   width: 10,
                  // )
                ],
              )),
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
