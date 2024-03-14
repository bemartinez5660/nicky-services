import 'package:flutter/material.dart';

class Rating extends StatefulWidget {
  const Rating({super.key, required this.rate});
  final int rate;

  @override
  State<Rating> createState() => _RatingState();
}

class _RatingState extends State<Rating> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 15,
      child: Row(
        children: List.generate(
          5,
          (index) {
            return index < widget.rate
                ? Image.asset('assets/images/gold_star.png')
                : Image.asset('assets/images/grey_star.png');
          },
        ),
      ),
    );
  }
}
