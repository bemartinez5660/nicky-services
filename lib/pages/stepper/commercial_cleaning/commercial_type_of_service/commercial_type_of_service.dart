import 'dart:ui';

import 'package:cleanserv/models/input.dart';
import 'package:cleanserv/pages/stepper/commercial_cleaning/type_property/type_property_page.dart';
import 'package:cleanserv/pages/stepper/residential_cleaning/recurrence/recurrence_page.dart';
import 'package:cleanserv/pages/stepper/residential_cleaning/carpet_cleaning/rooms_number_page.dart';
import 'package:cleanserv/pages/stepper/commercial_cleaning/commercial_type_of_service/commercial_type_of_service_controller.dart';
import 'package:cleanserv/widgets/image_header_widget.dart';
import 'package:cleanserv/widgets/kind_of_cleaning_widgets/kind_of_cleaning_horizontal_card.dart';
import 'package:cleanserv/widgets/services/complementary_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../widgets/bottom_navigation.dart';

class CommercialTypeOfServicePage extends StatefulWidget {
  const CommercialTypeOfServicePage({super.key, required this.residential});
  final bool residential;

  @override
  State<CommercialTypeOfServicePage> createState() =>
      _CommercialTypeOfServicePageState();
}

class _CommercialTypeOfServicePageState
    extends State<CommercialTypeOfServicePage> {
  int _selectedItem = 0;
  late Input input;
  bool flag = true;
  CommercialTypeOfServiceController controller =
      CommercialTypeOfServiceController();

  @override
  void initState() {
    super.initState();
    controller.loadCommercialServicesTypes();
  }

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    final width = screen.width;

    List<String> kindsOfCommercialCleaning = [
      "Carpet cleaning",
      "Commercial carpet cleaning",
    ];

    List<String> commercialImages = [
      "assets/images/carpet_cleaning.png",
      "assets/images/commercial_carpet_cleaning.png",
    ];

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
                  GetBuilder<CommercialTypeOfServiceController>(
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
                                              "${controller.nodes[0]["abbreviation"]}"))));
                        }
                        return Column(
                          children: [
                            //--------------------------------LISTAAAA-------------------------------------
                            SizedBox(
                              height: 230,
                              child: ListView.builder(
                                  itemCount: kindsOfCommercialCleaning.length,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          Servicetype serviceType = Servicetype(
                                              connect: ServicetypeConnect(
                                                  abbreviation: Id(
                                                      exact:
                                                          "${controller.nodes[index]["abbreviation"]}")));
                                          input.servicetype = serviceType;
                                          _selectedItem = index;
                                        });
                                      },
                                      child: KindOfCleaningHorizontalCard(
                                        title: kindsOfCommercialCleaning[index],
                                        selectedItem: _selectedItem,
                                        imagePath: commercialImages[index],
                                        corner: 'left',
                                        color: Colors.black,
                                        selectionMode: 'single',
                                        index: index,
                                        long: 0,
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
                  if (input.servicetype!.connect!.abbreviation!.exact == 'CS') {
                    Get.to(() => RecurrencePage(
                          input: input,
                        ));
                  } else {
                    Get.to(() => TypePropertyPage(
                          input: input,
                        ));
                  }
                }),
          ),
        ],
      ),
    );
  }
}
