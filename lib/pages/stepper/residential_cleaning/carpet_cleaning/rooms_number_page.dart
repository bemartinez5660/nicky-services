import 'dart:ui';

import 'package:cleanserv/models/input.dart';
import 'package:cleanserv/pages/stepper/residential_cleaning/carpet_cleaning/carpet_cleaning_type/carpet_cleaning_type_page.dart';
import 'package:cleanserv/widgets/image_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../widgets/bottom_navigation.dart';
import '../../../../widgets/form_item.dart';

class RoomsNumberPage extends StatefulWidget {
  const RoomsNumberPage({super.key, required this.input});
  final Input input;

  @override
  State<RoomsNumberPage> createState() => _RoomsNumberPageState();
}

class _RoomsNumberPageState extends State<RoomsNumberPage> {
  int _selectedItem = 0;

  @override
  void initState() {
    super.initState();
    widget.input.userserviceconfigSet = UserserviceconfigSet(create: [
      Create(
          parameter: Parameter(
              connect: ParameterConnect(parameter: Id(exact: "bedrooms"))),
          quantity: _selectedItem + 1)
    ]);
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
                Colors.white.withOpacity(0.7),
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
                    "How many rooms need to be cleaned?",
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
                      itemCount: 6,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            setState(() {
                              widget.input.userserviceconfigSet!.create!
                                  .removeWhere((element) =>
                                      element.parameter!.connect!.parameter!
                                          .exact ==
                                      "bedrooms");
                              widget.input.userserviceconfigSet =
                                  UserserviceconfigSet(create: [
                                Create(
                                    parameter: Parameter(
                                        connect: ParameterConnect(
                                            parameter: Id(exact: "bedrooms"))),
                                    quantity: index + 1)
                              ]);
                              _selectedItem = index;
                            });
                          },
                          child: FormItem(
                              selectedItem: _selectedItem,
                              index: index,
                              itemText: index == 0
                                  ? "1 room"
                                  : "${index + 1} rooms"))),
                ),
              ],
            ),
          )),
          BottomNavigation(
              disabledBackButton: false,
              disabledNextButton: false,
              loadingNextButton: false,
              nextFunction: () {
                Get.to(() => CarpetCleaningTypePage(
                      input: widget.input,
                    ));
              }),
        ],
      ),
    );
  }
}
