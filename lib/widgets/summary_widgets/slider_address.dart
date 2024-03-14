import 'package:cleanserv/widgets/summary_widgets/counter_summary.dart';
import 'package:flutter/material.dart';
import 'package:cleanserv/models/result.dart';

class SliderAddress extends StatefulWidget {
  const SliderAddress({super.key, required this.result});
  final Result result;

  @override
  State<SliderAddress> createState() => _SliderAddressState();
}

class _SliderAddressState extends State<SliderAddress> {
  bool expanded = true;
  bool selected = false;
  String address = '';

  @override
  void initState() {
    super.initState();
    address =
        "${widget.result.address.address}, ${widget.result.address.city}, ${widget.result.address.country}";

    if (widget.result.userserviceconfigSet.nodes[2].quantity == 0) {
      selected = false;
    } else {
      selected = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    final width = screen.width;
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
              color: Color.fromRGBO(76, 34, 141, 0.13),
              borderRadius: BorderRadius.all(Radius.circular(30))),
          width: width * 0.9,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 7,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(bottom: 5, top: 5, left: 21),
                        child: Center(
                          child: Text(
                            address,
                            // '5055 Willshire Blvd. Suite 860, Los Angeles CA',
                            style: const TextStyle(
                                fontSize: 11,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(21, 30, 51, 1)),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          expanded = !expanded;
                        });
                      },
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: const BoxDecoration(
                            color: Color.fromRGBO(31, 30, 51, 0.08),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        child: Icon(
                          expanded
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down,
                          size: 30,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          width: width * 0.9,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Visibility(
                maintainSize: false,
                maintainAnimation: true,
                maintainState: true,
                visible: expanded,
                child: Column(
                  children: [
                    CounterSummary(result: widget.result, room: 'bedrooms'),
                    const SizedBox(
                      height: 10,
                    ),
                    CounterSummary(result: widget.result, room: 'bathrooms'),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'No pets in home',
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(28, 28, 28, 1)),
                        ),
                        Row(
                          children: [
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  color: selected
                                      ? Colors.black
                                      : Colors.grey.shade300,
                                  borderRadius: BorderRadius.circular(40)),
                              child: GestureDetector(
                                onTap: () {
                                  // setState(() {
                                  //   widget.result.userserviceconfigSet
                                  //       .nodes[2].quantity = 1;
                                  //   selected = true;
                                  // });
                                },
                                child: Center(
                                  child: Text(
                                    'Yes',
                                    style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400,
                                        color: selected
                                            ? Colors.white
                                            : Colors.black),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  color: !selected
                                      ? Colors.black
                                      : Colors.grey.shade300,
                                  borderRadius: BorderRadius.circular(30)),
                              child: TextButton(
                                onPressed: () {
                                  // setState(() {
                                  //   widget.result.userserviceconfigSet
                                  //       .nodes[2].quantity = 0;
                                  //   selected = false;
                                  // });
                                },
                                child: Center(
                                  child: Text(
                                    'No',
                                    style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400,
                                        color: !selected
                                            ? Colors.white
                                            : Colors.black),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                )),
          ),
        )
      ],
    );
  }
}
