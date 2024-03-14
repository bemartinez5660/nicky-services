import 'dart:ui';

import 'package:cleanserv/models/input.dart';
import 'package:cleanserv/pages/stepper/commercial_cleaning/type_property/type_property_page.dart';
import 'package:cleanserv/pages/stepper/residential_cleaning/recurrence/recurrence_page.dart';
import 'package:cleanserv/pages/stepper/residential_cleaning/carpet_cleaning/rooms_number_page.dart';
import 'package:cleanserv/pages/stepper/residential_cleaning/type_of_service/type_of_service_controller.dart';
import 'package:cleanserv/widgets/image_header_widget.dart';
import 'package:cleanserv/widgets/kind_of_cleaning_widgets/kind_of_cleaning_horizontal_card.dart';
import 'package:cleanserv/widgets/services/complementary_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../widgets/bottom_navigation.dart';

class TypeOfServicePage extends StatefulWidget {
  const TypeOfServicePage({super.key, required this.residential});
  final bool residential;

  @override
  State<TypeOfServicePage> createState() => _TypeOfServicePageState();
}

class _TypeOfServicePageState extends State<TypeOfServicePage> {
  int _selectedItem = 0;
  late Input input;
  bool flag = true;
  TypeOfServiceController controller = TypeOfServiceController();

  @override
  void initState() {
    super.initState();
    controller.loadServicesTypes();
  }

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    final width = screen.width;
    List<String> kindsOfCleaning = [
      'Standard cleaning',
      'Deep Cleaning',
      "Carpet Cleaning",
      "Move out cleaning",
    ];

    List<String> firstHalf = kindsOfCleaning
        .where((element) =>
            kindsOfCleaning.indexOf(element) < kindsOfCleaning.length ~/ 2)
        .toList();
    List<String> secondHalf = kindsOfCleaning
        .where((element) =>
            kindsOfCleaning.indexOf(element) >= kindsOfCleaning.length ~/ 2)
        .toList();

    List<String> images = [
      "assets/images/standard_cleaning.png",
      'assets/images/deep_cleaning.png',
      "assets/images/carpet_cleaning.png",
      "assets/images/move_out_cleaning.png",
    ];

    List<String> secondImages = images
        .where((element) => images.indexOf(element) >= images.length ~/ 2)
        .toList();
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
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Center(
                      child: Text(
                    "What kind of cleaning do you need?",
                    softWrap: true,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w800,
                        letterSpacing: -1.05,
                        color: Color.fromRGBO(21, 30, 50, 0.8)),
                  )),
                  const SizedBox(
                    height: 50,
                  ),
                  GetBuilder<TypeOfServiceController>(
                    init: controller,
                    builder: (controller) {
                      if (controller.loading) {
                        return const CircularProgressIndicator();
                      } else {
                        if (flag) {
                          flag = false;
                          input = Input(
                              residential: widget.residential,
                              servicetype: Servicetype(
                                  connect: ServicetypeConnect(
                                      abbreviation: Id(
                                          exact:
                                              "${controller.nodes[3]["abbreviation"]}"))));
                        }
                        return Column(
                          children: [
                            SizedBox(
                              height: 210,
                              width: width,
                              child: GridView.builder(
                                  itemCount: firstHalf.length,
                                  physics: const NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 20,
                                    mainAxisSpacing: 20,
                                    mainAxisExtent: 212,
                                  ),
                                  itemBuilder: (context, index) {
                                    // final bool cant = index < kindsOfCleaning.length ~/ 2;

                                    if (index % 2 == 0) {
                                      return GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            Servicetype serviceType = Servicetype(
                                                connect: ServicetypeConnect(
                                                    abbreviation: Id(
                                                        exact:
                                                            "${controller.nodes[3]["abbreviation"]}")));
                                            input.servicetype = serviceType;
                                            _selectedItem = index;
                                          });
                                        },
                                        child: ComplementaryCard(
                                          title: kindsOfCleaning[index],
                                          imagePath: images[index],
                                          index: index,
                                          selectedItem: _selectedItem,
                                          corner: 'right',
                                          color: Colors.black,
                                          selectionMode: 'single',
                                        ),
                                      );
                                    } else {
                                      return GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            Servicetype serviceType = Servicetype(
                                                connect: ServicetypeConnect(
                                                    abbreviation: Id(
                                                        exact:
                                                            "${controller.nodes[1]["abbreviation"]}")));
                                            input.servicetype = serviceType;
                                            _selectedItem = index;
                                          });
                                        },
                                        child: ComplementaryCard(
                                          index: index,
                                          selectedItem: _selectedItem,
                                          title: kindsOfCleaning[index],
                                          imagePath: images[index],
                                          corner: 'left',
                                          color: Colors.black,
                                          selectionMode: 'single',
                                        ),
                                      );
                                    }
                                  }),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            //--------------------------------LISTAAAA-------------------------------------
                            SizedBox(
                              height: 230,
                              child: ListView.builder(
                                  itemCount: secondHalf.length,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          if (index == 0) {
                                            Servicetype serviceType = Servicetype(
                                                connect: ServicetypeConnect(
                                                    abbreviation: Id(
                                                        exact:
                                                            "${controller.nodes[0]["abbreviation"]}")));
                                            input.servicetype = serviceType;
                                          } else if (index == 1) {
                                            Servicetype serviceType = Servicetype(
                                                connect: ServicetypeConnect(
                                                    abbreviation: Id(
                                                        exact:
                                                            "${controller.nodes[2]["abbreviation"]}")));
                                            input.servicetype = serviceType;
                                          }
                                          _selectedItem =
                                              index + firstHalf.length;
                                        });
                                      },
                                      child: KindOfCleaningHorizontalCard(
                                        title: secondHalf[index],
                                        selectedItem: _selectedItem,
                                        imagePath: secondImages[index],
                                        corner: 'left',
                                        color: Colors.black,
                                        selectionMode: 'single',
                                        index: index,
                                        long: firstHalf.length,
                                      ),
                                    );
                                  }),
                            ),
                          ],
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
                  if (widget.residential) {
                    if (input.servicetype!.connect!.abbreviation!.exact ==
                        'RC') {
                      Get.to(() => RoomsNumberPage(
                            input: input,
                          ));
                    } else {
                      Get.to(() => RecurrencePage(
                            input: input,
                          ));
                    }
                  } else {
                    if (input.servicetype!.connect!.abbreviation!.exact ==
                        'RC') {
                      Get.to(() => RecurrencePage(
                            input: input,
                          ));
                    } else {
                      Get.to(() => TypePropertyPage(
                            input: input,
                          ));
                    }
                  }
                }),
          ),
        ],
      ),
    );
  }
}
