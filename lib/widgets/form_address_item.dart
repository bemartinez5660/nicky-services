import 'package:flutter/material.dart';

class FormAddressItem extends StatelessWidget {
  const FormAddressItem(
      {super.key,
      required this.itemText,
      required this.selectedItem,
      required this.index});
  final String itemText;
  final int selectedItem;
  final int index;

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    final width = screen.width;
    return Column(
      children: [
        Container(
          width: width * 0.9,
          decoration: const BoxDecoration(
              color: Color.fromRGBO(28, 28, 28, 0.1),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                  topLeft: Radius.circular(30))),
          child: Padding(
            padding: const EdgeInsets.all(25),
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
                  decoration: BoxDecoration(
                      color: selectedItem != index
                          ? const Color.fromRGBO(28, 28, 28, 0.1)
                          : const Color.fromRGBO(27, 158, 75, 0.5),
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
