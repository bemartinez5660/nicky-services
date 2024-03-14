import 'package:flutter/material.dart';

class CornerButton extends StatelessWidget {
  const CornerButton({super.key, required this.corner, required this.color});
  final String corner;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: corner == 'left' ? 1 : null,
      right: corner == 'right' ? 1 : null,
      child: InkWell(
        onTap: () {},
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
            topRight: Radius.circular(
              30,
            )),
        child: Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.only(
                  bottomLeft: const Radius.circular(30),
                  bottomRight: const Radius.circular(30),
                  topRight: corner == 'left'
                      ? const Radius.circular(
                          30,
                        )
                      : Radius.zero,
                  topLeft: corner == 'right'
                      ? const Radius.circular(30)
                      : Radius.zero)),
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Image.asset(
              "assets/images/document_icon.png",
            ),
          ),
        ),
      ),
    );
  }
}
