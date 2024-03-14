import 'dart:ui';

import 'package:cleanserv/environment.dart';
import 'package:cleanserv/models/input.dart';
import 'package:cleanserv/pages/stepper/residential_cleaning/carpet_cleaning/carpet_stains/carpet_stains_controller.dart';
import 'package:cleanserv/pages/stepper/residential_cleaning/recurrence/recurrence_page.dart';
import 'package:cleanserv/widgets/image_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../../../../../widgets/bottom_navigation.dart';
import '../../../../../widgets/multiselection_form_item.dart';

final HttpLink httpLink = HttpLink(Environment.endpoint);

final ValueNotifier<GraphQLClient> client = ValueNotifier<GraphQLClient>(
  GraphQLClient(
    link: httpLink,
    cache: GraphQLCache(),
  ),
);

class CarpetStainsPage extends StatefulWidget {
  const CarpetStainsPage({super.key, required this.input});
  final Input input;

  @override
  State<CarpetStainsPage> createState() => _CarpetStainsPageState();
}

class _CarpetStainsPageState extends State<CarpetStainsPage> {
  final List<int> _selecteds = [];
  List<dynamic> parameters = [];
  bool flag = true;
  CarpetStainsController controller = CarpetStainsController();

  @override
  void initState() {
    super.initState();
    controller.carpetStainsQuery();
  }

  carpetStainsName(String param) {
    switch (param) {
      case "pet stains in carpet":
        return "Pet stains";
      case "food stains in carpet":
        return "Food stains";
      case "drink stains in carpet":
        return "Drink stains";
      case "others stains in carpet":
        return "Others stains";
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    final height = screen.height;
    return GraphQLProvider(
      client: client,
      child: Scaffold(
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
                        "Does the carpet have any of these stains?",
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
                    //   options:
                    //       QueryOptions(document: gql(gql_str.carpetStains)),
                    //   builder: (result, {fetchMore, refetch}) {
                    //     if (result.hasException) {
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
                          parameters = controller.nodes;
                          if (flag) {
                            flag = false;
                            widget.input.userserviceconfigSet!.create!.add(
                                Create(
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
                                itemBuilder: (context, index) =>
                                    GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            if (!_selecteds.contains(index)) {
                                              _selecteds.add(index);
                                            } else {
                                              _selecteds.remove(index);
                                            }
                                            // widget.input.userserviceconfigSet!
                                            //     .create!
                                            //     .removeWhere((element) =>
                                            //         element.parameter!.connect!
                                            //             .parameter!.exact ==
                                            //         nodes[index]['parameter']);
                                            // widget.input.userserviceconfigSet!
                                            //     .create!
                                            //     .add(Create(
                                            //         parameter: Parameter(
                                            //             connect: ParameterConnect(
                                            //                 parameter: Id(
                                            //                     exact: nodes[
                                            //                             index][
                                            //                         'parameter']))),
                                            //         quantity: 1));
                                          });
                                        },
                                        child: MultiSelectionFormItem(
                                            selecteds: _selecteds,
                                            index: index,
                                            itemText: carpetStainsName(
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
                    for (var index in _selecteds) {
                      widget.input.userserviceconfigSet!.create!.removeWhere(
                          (element) =>
                              element.parameter!.connect!.parameter!.exact ==
                              parameters[index]['parameter']);
                      widget.input.userserviceconfigSet!.create!.add(Create(
                          parameter: Parameter(
                              connect: ParameterConnect(
                                  parameter: Id(
                                      exact: parameters[index]['parameter']))),
                          quantity: 1));
                    }

                    Get.to(() => RecurrencePage(
                          input: widget.input,
                        ));
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
