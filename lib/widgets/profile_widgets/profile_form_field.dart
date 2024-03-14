import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProfileFormField extends StatelessWidget {
  const ProfileFormField(
      {super.key,
      required this.image,
      required this.opacity,
      required this.hintText});
  final String image;
  final double opacity;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    final width = screen.width;
    return Column(
      children: [
        Container(
            width: width * 0.8,
            height: 40,
            decoration: ShapeDecoration(
              color: const Color.fromRGBO(21, 30, 51, 0.08),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 30,
                  height: 30,
                  decoration: ShapeDecoration(
                    color: Color.fromRGBO(21, 30, 51, opacity),
                    shape: const OvalBorder(),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: Image.asset(
                      image,
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    width: width * 0.65,
                    margin: const EdgeInsets.only(top: 17),
                    child: TextFormField(
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(20),
                      ],
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: hintText,
                        hintStyle: const TextStyle(
                          color: Color.fromRGBO(21, 30, 51, 0.4),
                          fontSize: 16,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                          letterSpacing: -0.56,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
