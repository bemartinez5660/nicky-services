import 'package:cleanserv/widgets/our_teams_widgets/rating.dart';
import 'package:flutter/material.dart';

class TeamCard extends StatefulWidget {
  const TeamCard(
      {super.key,
      required this.teamName,
      required this.rate,
      required this.name1,
      required this.name2});
  final String teamName;
  final int rate;
  final String name1;
  final String name2;

  @override
  State<TeamCard> createState() => _TeamCardState();
}

class _TeamCardState extends State<TeamCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 141,
      height: 141,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30)),
          color: Color.fromRGBO(255, 255, 255, 0.4)),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.teamName,
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Roboto',
                  color: Color.fromRGBO(28, 28, 28, 1)),
            ),
            const SizedBox(
              height: 5,
            ),
            Rating(rate: widget.rate),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              width: 116,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.name1,
                    style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Roboto',
                        color: Color.fromRGBO(28, 28, 28, 1)),
                  ),
                  Text(
                    widget.name2,
                    style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Roboto',
                        color: Color.fromRGBO(28, 28, 28, 1)),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              width: 122,
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(28, 28, 28, 0.1),
                  borderRadius: BorderRadius.circular(30)),
              child: Padding(
                padding: const EdgeInsets.only(top: 5, left: 19, bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text("Select"),
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(28, 28, 28, 0.1),
                          borderRadius: BorderRadius.circular(30)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.black)),
                              child: const Icon(
                                Icons.check,
                                size: 12,
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
