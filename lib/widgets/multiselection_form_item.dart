import 'package:flutter/material.dart';

class MultiSelectionFormItem extends StatelessWidget {
  const MultiSelectionFormItem(
      {super.key,
      required this.itemText,
      required this.selecteds,
      required this.index});
  final String itemText;
  final List<int> selecteds;
  final int index;

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    final width = screen.width;
    return Column(
      children: [
        Container(
          width: width * 0.9,
          height: 50,
          decoration: BoxDecoration(
              color: const Color.fromRGBO(28, 28, 28, 0.1),
              borderRadius: BorderRadius.circular(30)),
          child: Padding(
            padding: const EdgeInsets.only(left: 25, right: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 8,
                  child: Text(
                    itemText,
                    softWrap: true,
                  ),
                ),
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      color: selecteds.contains(index)
                          ? const Color.fromRGBO(27, 158, 75, 0.5)
                          : const Color.fromRGBO(28, 28, 28, 0.1),
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
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
