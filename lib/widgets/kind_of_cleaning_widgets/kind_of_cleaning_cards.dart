import 'package:flutter/material.dart';
import 'package:cleanserv/widgets/corner_button.dart';

class KindOfCleaningCards extends StatelessWidget {
  const KindOfCleaningCards(
      {super.key,
      required this.title1,
      required this.imagePath1,
      this.title2,
      this.imagePath2});
  final String title1;
  final String imagePath1;
  final String? title2;
  final String? imagePath2;

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    final width = screen.width;
    return Row(
      children: [
        Stack(
          children: [
            Container(
              width: width * 0.4,
              height: 212,
              padding: const EdgeInsets.all(15),
              decoration: const BoxDecoration(
                color: Color.fromRGBO(76, 34, 141, 0.13),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0),
                  topLeft: Radius.circular(30.0),
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(imagePath1, height: 60),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            title1,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                  ],
                ),
              ),
            ),
            const CornerButton(
                corner: 'right', color: Color.fromRGBO(21, 30, 51, 1))
          ],
        ),
        const SizedBox(
          width: 10,
        ),

        // Segundo card
        if (title2 != null)
          Stack(
            children: [
              Container(
                width: width * 0.4,
                height: 212,
                padding: const EdgeInsets.all(15),
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(76, 34, 141, 0.13),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(imagePath2.toString(), height: 60),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              title2 as String,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
                ),
              ),
              const CornerButton(
                  corner: 'left', color: Color.fromRGBO(21, 30, 51, 1))
            ],
          ),
      ],
    );
  }
}
