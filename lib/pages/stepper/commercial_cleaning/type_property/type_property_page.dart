import 'dart:ui';

import 'package:cleanserv/models/input.dart';
import 'package:cleanserv/pages/stepper/commercial_cleaning/type_property/type_property_controller.dart';
import 'package:cleanserv/pages/stepper/residential_cleaning/recurrence/recurrence_page.dart';
import 'package:cleanserv/widgets/image_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../widgets/bottom_navigation.dart';
import '../../../../../widgets/form_item.dart';

class TypePropertyPage extends StatefulWidget {
  const TypePropertyPage({super.key, required this.input});
  final Input input;

  @override
  State<TypePropertyPage> createState() => _TypePropertyPageState();
}

class _TypePropertyPageState extends State<TypePropertyPage> {
  int _selectedItem = 0;
  bool flag = true;
  TypePropertyController controller = TypePropertyController();

    @override
  void initState() {
    super.initState();
    controller.typePropertyQuery();
    // widget.input.userserviceconfigSet = UserserviceconfigSet(create: [
    //   Create(
    //       parameter: Parameter(
    //           connect: ParameterConnect(parameter: Id(exact: "bedrooms"))),
    //       quantity: _selectedItem + 1)
    // ]);
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
                    "What type of property would you like cleaned?",
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
                GetBuilder(
                  init: controller,
                  builder: (controller) {
                    if (controller.loading) {
                      return const CircularProgressIndicator();
                    } else {
                      if(flag){
                         widget.input.userserviceconfigSet =
                                        UserserviceconfigSet(create: [
                                      Create(
                                          parameter: Parameter(
                                              connect: ParameterConnect(
                                                  parameter: Id(
                                                      exact: controller
                                                              .nodes[0]
                                                          ['parameter']))),
                                          quantity: 1)
                                    ]);
                      }
                      return SizedBox(
                        height: height * 0.6,
                        child: ListView.builder(
                            itemCount: controller.nodes.length,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) => GestureDetector(
                                onTap: () {
                                  setState(() {
                                    widget.input.userserviceconfigSet!.create!
                                        .removeWhere((element) =>
                                            element.parameter!.connect!
                                                .parameter!.exact ==
                                            controller.nodes[_selectedItem]
                                                ['parameter']);
                                    widget.input.userserviceconfigSet =
                                        UserserviceconfigSet(create: [
                                      Create(
                                          parameter: Parameter(
                                              connect: ParameterConnect(
                                                  parameter: Id(
                                                      exact: controller
                                                              .nodes[index]
                                                          ['parameter']))),
                                          quantity: 1)
                                    ]);
                                    _selectedItem = index;
                                  });
                                },
                                child: FormItem(
                                    selectedItem: _selectedItem,
                                    index: index,
                                    itemText: (controller.nodes[index]
                                            ['parameter'] as String)
                                        .capitalizeFirst
                                        .toString()))),
                      );
                    }
                  },
                ),
              ],
            ),
          )),
          GetBuilder(
            init: controller,
            builder: (controller) => BottomNavigation(
                disabledBackButton: false,
                disabledNextButton: controller.loading,
                loadingNextButton: false,
                nextFunction: () {
                  Get.to(() => RecurrencePage(
                        input: widget.input,
                      ));
                }),
          ),
        ],
      ),
    );
  }
}
