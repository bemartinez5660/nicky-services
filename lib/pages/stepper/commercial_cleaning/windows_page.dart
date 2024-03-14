import 'dart:ui';

import 'package:cleanserv/models/input.dart';
import 'package:cleanserv/pages/stepper/residential_cleaning/appointment/appointment_page.dart';
import 'package:cleanserv/widgets/image_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../widgets/bottom_navigation.dart';
import '../../../../widgets/form_item.dart';

class WindowsPage extends StatefulWidget {
  const WindowsPage({super.key, required this.input});
  final Input input;

  @override
  State<WindowsPage> createState() => _WindowsPageState();
}

class _WindowsPageState extends State<WindowsPage> {
  int _selectedItem = 0;
  List<String> propTypes = [
    'No windows',
    '1-5 windows',
    '6-10 windows',
    '11-15 windows',
    '16-20 windows',
    '21-25 windows',
    '26-30 windows'
  ];

  @override
  void initState() {
    super.initState();
    widget.input.userserviceconfigSet!.create!.add(Create(
        parameter: Parameter(
            connect: ParameterConnect(parameter: Id(exact: "windows"))),
        quantity: 0));
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
                    "How many windows would you like cleaned?",
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
                      itemCount: propTypes.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            setState(() {
                              widget.input.userserviceconfigSet!.create!
                                  .removeWhere((element) =>
                                      element.parameter!.connect!.parameter!
                                          .exact ==
                                      "windows");
                              widget.input.userserviceconfigSet!.create!.add(
                                  Create(
                                      parameter: Parameter(
                                          connect: ParameterConnect(
                                              parameter: Id(exact: "windows"))),
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
                Get.to(() => AppointmentPage(
                      input: widget.input,
                    ));
              }),
        ],
      ),
    );
  }
}
