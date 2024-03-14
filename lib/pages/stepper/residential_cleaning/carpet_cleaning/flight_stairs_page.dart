import 'dart:ui';

import 'package:cleanserv/models/input.dart';
import 'package:cleanserv/pages/stepper/pets_in_house.dart';
import 'package:cleanserv/widgets/image_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../widgets/bottom_navigation.dart';
import '../../../../widgets/form_item.dart';

class FlightStairsPage extends StatefulWidget {
  const FlightStairsPage({super.key, required this.input});
  final Input input;

  @override
  State<FlightStairsPage> createState() => _FlightStairsPageState();
}

class _FlightStairsPageState extends State<FlightStairsPage> {
  int _selectedItem = 0;

  @override
  void initState() {
    super.initState();
    widget.input.userserviceconfigSet!.create!.removeWhere((element) =>
        element.parameter!.connect!.parameter!.exact == "flight of stairs");
    widget.input.userserviceconfigSet!.create!.add(Create(
        parameter: Parameter(
            connect:
                ParameterConnect(parameter: Id(exact: "flight of stairs"))),
        quantity: _selectedItem));
  }

  flightStairsItemName(int quantity) {
    switch (quantity) {
      case 0:
        return "No stairs";
      case 1:
        return "1 flight";
      default:
        return "$quantity flights";
    }
  }

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    final height = screen.height;
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(
                    0.7), // Ajusta la opacidad según tus necesidades
                BlendMode.srcATop,
              ),
              child: const ImageHeader(),
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
            child: Container(
              color: Colors.white.withOpacity(0.75),
            ),
          ),
          SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Center(
                    child: Padding(
                  padding: EdgeInsets.only(top: 25),
                  child: Text(
                    "How many flights of stairs would you like cleaned?",
                    softWrap: true,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w800,
                        // height: 0.04,
                        letterSpacing: -1.05,
                        color: Color.fromRGBO(21, 30, 50, 0.8)),
                  ),
                )),
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  height: height * 0.6,
                  child: ListView.builder(
                      itemCount: 4,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            setState(() {
                              widget.input.userserviceconfigSet!.create!
                                  .removeWhere((element) =>
                                      element.parameter!.connect!.parameter!
                                          .exact ==
                                      "flight of stairs");
                              widget.input.userserviceconfigSet!.create!.add(
                                  Create(
                                      parameter: Parameter(
                                          connect: ParameterConnect(
                                              parameter: Id(
                                                  exact: "flight of stairs"))),
                                      quantity: index));
                              _selectedItem = index;
                            });
                          },
                          child: FormItem(
                              selectedItem: _selectedItem,
                              index: index,
                              itemText: flightStairsItemName(index)))),
                ),
              ],
            ),
          )),
          BottomNavigation(
              disabledBackButton: false,
              disabledNextButton: false,
              loadingNextButton: false,
              nextFunction: () {
                Get.to(() => PetsInHouse(
                      input: widget.input,
                    ));
              }),
        ],
      ),
    );
  }
}
