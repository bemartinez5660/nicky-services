import 'dart:ui';

import 'package:cleanserv/models/input.dart';
import 'package:cleanserv/pages/stepper/residential_cleaning/appointment/appointment_page.dart';
import 'package:cleanserv/pages/stepper/commercial_cleaning/windows_page.dart';
import 'package:cleanserv/widgets/image_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../widgets/bottom_navigation.dart';
import '../../../../widgets/form_item.dart';

class SquareFootagePage extends StatefulWidget {
  final Input input;
  const SquareFootagePage({super.key, required this.input});

  @override
  State<SquareFootagePage> createState() => _SquareFootagePageState();
}

class _SquareFootagePageState extends State<SquareFootagePage> {
  int _selectedItem = 0;
  List<String> propTypes = [
    'Less than 1,000 sq ft',
    '1,000-2,000 sq ft',
    '2,000-3,000 sq ft',
    '3,000-4,000 sq ft',
    '4,000-5,000 sq ft',
    '5,000-6,000 sq ft',
    '6,000-7,000 sq ft',
    '7,000-8,000 sq ft',
    '8,000-9,000 sq ft',
    '9,000-10,000 sq ft',
  ];

  @override
  void initState() {
    super.initState();
    if (widget.input.userserviceconfigSet != null) {
      widget.input.userserviceconfigSet!.create!.add(Create(
          parameter: Parameter(
              connect: ParameterConnect(parameter: Id(exact: "sq ft"))),
          quantity: 0));
    } else {
      widget.input.userserviceconfigSet = UserserviceconfigSet(create: [
        Create(
            parameter: Parameter(
                connect: ParameterConnect(parameter: Id(exact: "sq ft"))),
            quantity: 1)
      ]);
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
                    "What is the aproximate square footage of the area to be cleaned?",
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
                  height: height * 0.65,
                  child: ListView.builder(
                      itemCount: propTypes.length,
                      // physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            setState(() {
                              widget.input.userserviceconfigSet!.create!
                                  .removeWhere((element) =>
                                      element.parameter!.connect!.parameter!
                                          .exact ==
                                      "sq ft");
                              widget.input.userserviceconfigSet!.create!.add(
                                  Create(
                                      parameter: Parameter(
                                          connect: ParameterConnect(
                                              parameter: Id(exact: "sq ft"))),
                                      quantity: index));
                              _selectedItem = index;
                            });
                          },
                          child: FormItem(
                              selectedItem: _selectedItem,
                              index: index,
                              itemText: propTypes[index]))),
                ),
              ],
            ),
          )),
          BottomNavigation(
              disabledBackButton: false,
              disabledNextButton: false,
              loadingNextButton: false,
              nextFunction: () {
                if (widget.input.servicetype!.connect!.abbreviation!.exact ==
                    'RC') {
                  Get.to(() => AppointmentPage(
                        input: widget.input,
                      ));
                } else {
                  Get.to(() => WindowsPage(
                        input: widget.input,
                      ));
                }
              }),
        ],
      ),
    );
  }
}
