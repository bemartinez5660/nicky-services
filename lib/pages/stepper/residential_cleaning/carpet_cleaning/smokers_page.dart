import 'dart:ui';

import 'package:cleanserv/models/input.dart';
import 'package:cleanserv/pages/stepper/residential_cleaning/carpet_cleaning/carpet_stains/carpet_stains_page.dart';
import 'package:cleanserv/widgets/image_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../widgets/bottom_navigation.dart';
import '../../../../widgets/form_item.dart';

class SmokersPage extends StatefulWidget {
  const SmokersPage({super.key, required this.input});
  final Input input;

  @override
  State<SmokersPage> createState() => _SmokersPageState();
}

class _SmokersPageState extends State<SmokersPage> {
  int _selectedItem = 0;
  List<String> smokers = ['Smokers in home', 'No smokers in home'];

  @override
  void initState() {
    super.initState();
    widget.input.userserviceconfigSet!.create!.removeWhere(
        (element) => element.parameter!.connect!.parameter!.exact == "smokers");
    widget.input.userserviceconfigSet!.create!.add(Create(
        parameter: Parameter(
            connect: ParameterConnect(parameter: Id(exact: "smokers"))),
        quantity: _selectedItem));
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
                    "Does anyone regularly smoke inside?",
                    softWrap: true,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w800,
                        letterSpacing: -1.05,
                        color: Color.fromRGBO(21, 30, 50, 0.8)),
                  ),
                )),
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  height: height * 0.2,
                  child: ListView.builder(
                      itemCount: 2,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            setState(() {
                              // widget.input.userserviceconfigSet.nodes
                              //     .removeWhere(
                              //         (element) => element.parameter.id == "5");
                              // widget.input.userserviceconfigSet.nodes
                              //     .add(ServiceNode(
                              //   parameter:
                              //       Parameter(id: '5', parameter: 'pets'),
                              //   quantity: index,
                              // ));
                              widget.input.userserviceconfigSet!.create!
                                  .removeWhere((element) =>
                                      element.parameter!.connect!.parameter!
                                          .exact ==
                                      "smokers");
                              widget.input.userserviceconfigSet!.create!.add(
                                  Create(
                                      parameter: Parameter(
                                          connect: ParameterConnect(
                                              parameter: Id(exact: "smokers"))),
                                      quantity: index));
                              _selectedItem = index;
                            });
                          },
                          child: FormItem(
                              selectedItem: _selectedItem,
                              index: index,
                              itemText: smokers[index]))),
                ),
              ],
            ),
          )),
          BottomNavigation(
              disabledBackButton: false,
              disabledNextButton: false,
              loadingNextButton: false,
              nextFunction: () {
                Get.to(() => CarpetStainsPage(
                      input: widget.input,
                    ));
              }),
        ],
      ),
    );
  }
}
