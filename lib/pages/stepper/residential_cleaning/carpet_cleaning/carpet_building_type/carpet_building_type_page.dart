import 'dart:ui';

import 'package:cleanserv/models/input.dart';
import 'package:cleanserv/pages/stepper/residential_cleaning/carpet_cleaning/carpet_building_type/carpet_building_type_controller.dart';
import 'package:cleanserv/pages/stepper/residential_cleaning/carpet_cleaning/smokers_page.dart';
import 'package:cleanserv/widgets/image_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../widgets/bottom_navigation.dart';
import '../../../../../widgets/form_item.dart';

class CarpetBuildingTypePage extends StatefulWidget {
  const CarpetBuildingTypePage({super.key, required this.input});
  final Input input;

  @override
  State<CarpetBuildingTypePage> createState() => _CarpetBuildingTypePageState();
}

class _CarpetBuildingTypePageState extends State<CarpetBuildingTypePage> {
  int _selectedItem = 0;
  bool flag = true;
  CarpetBuildingTypeController controller = CarpetBuildingTypeController();

  @override
  void initState() {
    super.initState();
    controller.carpetBuildingTypeQuery();
  }

  carpetBuildingTypeName(String param) {
    switch (param) {
      case "carpet located in apartment or condo":
        return "Apartment or condo";
      case "carpet located in multi unit house":
        return "Multi-unit building";
      case "carpet located in one history house":
        return "One-history house";
      case "carpet located in two history house":
        return "Two-history house";
      default:
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
          SingleChildScrollView(
            child: SafeArea(
                child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Center(
                      child: Padding(
                    padding: EdgeInsets.only(top: 25),
                    child: Text(
                      "What kind of building is the carpet in?",
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
                  // Query(
                  //   options: QueryOptions(
                  //       document: gql(gql_str.carpetBuildingType)),
                  //   builder: (result, {fetchMore, refetch}) {
                  //     if (result.hasException) {
                  //       // print(result.exception);
                  //       return const Center(
                  //         child: Text(
                  //             'Error loading availables types of carpet cleaning.'),
                  //       );
                  //     }

                  //     if (result.isLoading) {
                  //       return const Center(
                  //         child: CircularProgressIndicator(),
                  //       );
                  //     }

                  //     if (result.data != null) {
                  //       List<dynamic> nodes =
                  //           result.data?['serviceparameters']['nodes'] ?? [];

                  //     } else {
                  //       return const Center(
                  //         child: Text(
                  //             'Error loading availables types of carpet cleaning.'),
                  //       );
                  //     }
                  //   },
                  // ),
                  GetBuilder(
                    init: controller,
                    builder: (controller) {
                      if (controller.loading) {
                        return const CircularProgressIndicator();
                      } else {
                        if (flag) {
                          flag = false;
                          widget.input.userserviceconfigSet!.create!.add(Create(
                              parameter: Parameter(
                                  connect: ParameterConnect(
                                      parameter: Id(
                                          exact: controller.nodes[0]
                                              ['parameter']))),
                              quantity: 1));
                        }
                        return SizedBox(
                          height: height * 0.5,
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
                                      widget.input.userserviceconfigSet!.create!
                                          .add(Create(
                                              parameter: Parameter(
                                                  connect: ParameterConnect(
                                                      parameter: Id(
                                                          exact: controller
                                                                  .nodes[index]
                                                              ['parameter']))),
                                              quantity: 1));
                                      _selectedItem = index;
                                    });
                                  },
                                  child: FormItem(
                                      selectedItem: _selectedItem,
                                      index: index,
                                      itemText: carpetBuildingTypeName(
                                          controller.nodes[index]
                                              ['parameter'])))),
                        );
                      }
                    },
                  ),
                  const SizedBox(
                    height: 100,
                  )
                ],
              ),
            )),
          ),
          GetBuilder(
            init: controller,
            builder: (controller) => BottomNavigation(
                disabledBackButton: false,
                disabledNextButton: controller.loading,
                loadingNextButton: false,
                nextFunction: () {
                  Get.to(() => SmokersPage(
                        input: widget.input,
                      ));
                }),
          ),
        ],
      ),
    );
  }
}
