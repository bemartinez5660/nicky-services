import 'package:cleanserv/models/result.dart';
import 'package:cleanserv/widgets/corner_button.dart';
import 'package:flutter/material.dart';

class ServicesCards extends StatefulWidget {
  const ServicesCards({super.key, required this.result});
  final Result result;

  @override
  State<ServicesCards> createState() => _ServicesCardsState();
}

class _ServicesCardsState extends State<ServicesCards> {
  String serviceName = '';
  String serviceImage = '';

  @override
  void initState() {
    super.initState();
    cleanService();
  }

  void cleanService() {
    switch (widget.result.servicetype.servicetype) {
      case 'Standard Residential Cleaning':
        serviceName = 'Standard Cleaning';
        serviceImage = "assets/images/standard_cleaning.png";
        break;
      case 'Move Out Residential Cleaning':
        serviceName = 'Move Out Cleaning';
        serviceImage = "assets/images/move_out_cleaning.png";
        break;
      case 'Deep Residential Cleaning':
        serviceName = 'Deep Cleaning';
        serviceImage = 'assets/images/deep_cleaning.png';

        break;
      case 'Carpet Residential Cleaning':
        serviceName = 'Carpet Cleaning';
        serviceImage = "assets/images/carpet_cleaning.png";
        break;
      default:
    }
  }

  List<String> images = [
    "assets/images/standard_cleaning.png",
    'assets/images/deep_cleaning.png',
    "assets/images/carpet_cleaning.png",
    "assets/images/move_out_cleaning.png",
  ];

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    final width = screen.width;
    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: width * 0.9,
              padding: const EdgeInsets.all(15),
              decoration: const BoxDecoration(
                color: Color.fromRGBO(76, 34, 141, 0.13),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(serviceImage, height: 70),
                    const SizedBox(
                      width: 40,
                    ),
                    Flexible(
                      child: Text(
                        serviceName,
                        // textAlign: TextAlign.justify,
                        style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Roboto',
                            color: Color.fromRGBO(28, 28, 28, 1)),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                  ],
                ),
              ),
            ),
            const CornerButton(corner: 'left', color: Colors.black)
          ],
        ),
      ],
    );
  }
}
