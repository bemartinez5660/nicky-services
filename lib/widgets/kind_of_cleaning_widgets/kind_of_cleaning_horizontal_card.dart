import 'package:cleanserv/widgets/corner_button.dart';
import 'package:flutter/material.dart';

class KindOfCleaningHorizontalCard extends StatelessWidget {
  const KindOfCleaningHorizontalCard(
      {super.key,
      required this.title,
      required this.imagePath,
      required this.index,
      required this.corner,
      required this.selectionMode,
      required this.color,
      this.selecteds,
      required this.selectedItem,
      required this.long});
  final String title;
  final String imagePath;
  final int index;
  final String corner;
  final String selectionMode;
  final int selectedItem;
  final Color color;
  final List<int>? selecteds;
  final int long;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              decoration: const BoxDecoration(
                color: Color.fromRGBO(89, 38, 166, 0.13),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 36,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        title,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Roboto',
                            color: Color.fromRGBO(28, 28, 28, 1)),
                      ),
                    ),
                    // const SizedBox(
                    //   width: 20,
                    // ),
                    Expanded(
                        flex: 1, child: Image.asset(imagePath, height: 65)),
                  ],
                ),
              ),
            ),
            if (selectedItem == index + long)
              CornerButton(corner: corner, color: color)
          ],
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
