import 'package:flutter/material.dart';
import 'package:cleanserv/widgets/corner_button.dart';

class ComplementaryCard extends StatelessWidget {
  const ComplementaryCard(
      {super.key,
      required this.title,
      required this.imagePath,
      required this.selectedItem,
      required this.index,
      required this.corner,
      required this.selectionMode,
      required this.color,
      this.selecteds});
  final String title;
  final String imagePath;
  final int selectedItem;
  final int index;
  final String corner;
  final String selectionMode;
  final Color color;
  final List<int>? selecteds;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 212,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(76, 34, 141, 0.13),
            borderRadius: BorderRadius.only(
              bottomLeft: const Radius.circular(30.0),
              bottomRight: const Radius.circular(30.0),
              topLeft:
                  corner == 'right' ? const Radius.circular(30.0) : Radius.zero,
              topRight:
                  corner == 'right' ? Radius.zero : const Radius.circular(30.0),
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
                      Image.asset(imagePath, height: 60),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
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
        if (index == selectedItem && selectionMode == 'single')
          CornerButton(corner: corner, color: color)
        else if (selectionMode == 'multi')
          if (selecteds != null)
            if (selecteds!.contains(index))
              CornerButton(corner: corner, color: color)
      ],
    );
  }
}
