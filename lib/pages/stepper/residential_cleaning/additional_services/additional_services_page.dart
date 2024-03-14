import 'dart:ui';

import 'package:cleanserv/models/input.dart';
import 'package:cleanserv/pages/stepper/residential_cleaning/appointment/appointment_page.dart';
import 'package:cleanserv/pages/stepper/residential_cleaning/additional_services/additional_services_controller.dart';
import 'package:cleanserv/widgets/services/complementary_card.dart';
import 'package:cleanserv/widgets/image_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../../../../widgets/bottom_navigation.dart';

class AdditionalServicesPage extends StatefulWidget {
  const AdditionalServicesPage({super.key, required this.input});
  final Input input;

  @override
  State<AdditionalServicesPage> createState() => _AdditionalServicesPageState();
}

class _AdditionalServicesPageState extends State<AdditionalServicesPage> {
  final int _selectedItem = 0;
  final List<int> _selecteds = [];
  List<dynamic> parameters = [];
  AdditionalServicesController controller = AdditionalServicesController();

  @override
  void initState() {
    super.initState();
    controller.additionalServicesQuery();
  }

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    final height = screen.height;
    final width = screen.width;

    List<String> additionalServices = [
      "Oven cleaning",
      "Fridge cleaning",
      "Window cleaning",
      "Laundry",
      "Dishwashing"
    ];
    List<String> images = [
      'assets/images/washing_machine.png',
      'assets/images/friedge.png',
      'assets/images/washing_window.png',
      'assets/images/laundry.png',
      'assets/images/dishwashing.png'
    ];

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
                        child: Text(
                      "Is there anything else you need?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w800,
                          letterSpacing: -1.05,
                          color: Color.fromRGBO(21, 30, 50, 0.8)),
                    )),
                    const SizedBox(
                      height: 20,
                    ),
                    // Query(
                    //   options: QueryOptions(
                    //       document: gql(gql_str.additionalServices)),
                    //   builder: (result, {fetchMore, refetch}) {
                    //     if (result.hasException) {
                    //       // print(result.exception);
                    //       return const Center(
                    //         child:
                    //             Text('Error loading availables recurrences.'),
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
                    //       parameters = nodes;
                    //       // if (flag) {
                    //       //   flag = false;
                    //       //   _editService.recurrence =
                    //       //       Recurrence.fromJson(nodes[0]);
                    //       // }
                    //       return;
                    //     } else {
                    //       return const Center(
                    //         child:
                    //             Text('Error loading availables recurrences.'),
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
                          return SizedBox(
                            height: height - 180,
                            width: width,
                            child: GridView.builder(
                                itemCount: additionalServices.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 20,
                                  mainAxisExtent: 212,
                                ),
                                itemBuilder: (context, index) {
                                  if (index % 2 == 0) {
                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          if (!_selecteds.contains(index)) {
                                            _selecteds.add(index);
                                          } else {
                                            _selecteds.remove(index);
                                          }
                                        });
                                      },
                                      child: ComplementaryCard(
                                        title: additionalServices[index],
                                        imagePath: images[index],
                                        index: index,
                                        selectedItem: _selectedItem,
                                        corner: 'right',
                                        color: const Color.fromRGBO(
                                            89, 38, 168, 1),
                                        selectionMode: 'multi',
                                        selecteds: _selecteds,
                                      ),
                                    );
                                  } else {
                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          if (!_selecteds.contains(index)) {
                                            _selecteds.add(index);
                                          } else {
                                            _selecteds.remove(index);
                                          }
                                        });
                                      },
                                      child: ComplementaryCard(
                                        index: index,
                                        selectedItem: _selectedItem,
                                        title: additionalServices[index],
                                        imagePath: images[index],
                                        corner: 'left',
                                        color: const Color.fromRGBO(
                                            89, 38, 168, 1),
                                        selectionMode: 'multi',
                                        selecteds: _selecteds,
                                      ),
                                    );
                                  }
                                }),
                          );
                        }
                      },
                    ),
                    const SizedBox(
                      height: 200,
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
                              additionalServices[index]);
                      widget.input.userserviceconfigSet!.create!.add(Create(
                          parameter: Parameter(
                              connect: ParameterConnect(
                                  parameter: Id(
                                      exact: additionalServices[index]
                                          .toLowerCase()))),
                          quantity: 1));
                    }
                    Get.to(() => AppointmentPage(
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
