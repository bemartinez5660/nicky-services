import 'package:flutter/material.dart';
import 'package:cleanserv/models/result.dart';

class CounterSummary extends StatefulWidget {
  const CounterSummary({super.key, required this.result, required this.room});
  final Result result;
  final String room;

  @override
  State<CounterSummary> createState() => _CounterSummaryState();
}

class _CounterSummaryState extends State<CounterSummary> {
  int roomIndex = 0;

  @override
  void initState() {
    super.initState();
    if (widget.room == 'bedrooms') {
      roomIndex = 0;
    } else if (widget.room == 'bathrooms') {
      roomIndex = 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "${widget.result.userserviceconfigSet.nodes[roomIndex].quantity} ${widget.room}",
          style: const TextStyle(
              fontSize: 16,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
              color: Color.fromRGBO(28, 28, 28, 1)),
        ),
        Row(
          children: [
            //Primer Boton
            Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(21, 30, 51, 0.05),
                  borderRadius: BorderRadius.circular(30)),
              child: GestureDetector(
                onTap: () {
                  // setState(() {
                  //   // if (widget.result.userserviceconfigSet.nodes[roomIndex]
                  //   //         .quantity >
                  //   //     1) {
                  //   //   widget.result.userserviceconfigSet.nodes[roomIndex]
                  //   //       .quantity -= 1;
                  //   // }
                  // });
                },
                child: const Icon(
                  Icons.remove,
                  size: 16,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              width: 15,
            ),

            //Segundo Boton
            Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(21, 30, 51, 0.05),
                  borderRadius: BorderRadius.circular(30)),
              child: GestureDetector(
                onTap: () {
                  // setState(() {
                  //   // widget.result.userserviceconfigSet.nodes[roomIndex]
                  //   //     .quantity += 1;
                  // });
                },
                child: const Icon(
                  Icons.add,
                  size: 16,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
