import 'dart:ui';

import 'package:cleanserv/models/input.dart';
import 'package:cleanserv/pages/stepper/commercial_cleaning/square_footage_page.dart';
import 'package:cleanserv/pages/stepper/residential_cleaning/appointment/appointment_page.dart';
import 'package:cleanserv/pages/stepper/bedrooms_number.dart';
import 'package:cleanserv/pages/stepper/residential_cleaning/recurrence/recurrence_controller.dart';
import 'package:cleanserv/widgets/image_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../widgets/bottom_navigation.dart';
import '../../../../widgets/form_item.dart';

class RecurrencePage extends StatefulWidget {
  const RecurrencePage({super.key, required this.input});
  final Input input;

  @override
  State<RecurrencePage> createState() => _RecurrencePageState();
}

class _RecurrencePageState extends State<RecurrencePage> {
  int _selectedItem = 0;
  bool flag = true;
  RecurrenceController control = RecurrenceController();

  @override
  void initState() {
    super.initState();
    control.recurrenceQuery();
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
                      "How often do you want the house cleaned?",
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
                  GetBuilder<RecurrenceController>(
                      init: control,
                      builder: (controller) {
                        if (controller.loading) {
                          return const CircularProgressIndicator();
                        } else {
                          if (flag) {
                            flag = false;
                            widget.input.recurrence = Recurrence(
                                connect: RecurrenceConnect(
                                    recurrence: Id(
                                        exact: controller.nodes[0]
                                            ['recurrence'])));
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
                                            Recurrence rec = Recurrence(
                                                connect: RecurrenceConnect(
                                                    recurrence: Id(
                                                        exact: controller
                                                                .nodes[index]
                                                            ['recurrence'])));
                                            widget.input.recurrence = rec;
                                            _selectedItem = index;
                                          });
                                        },
                                        child: FormItem(
                                            selectedItem: _selectedItem,
                                            index: index,
                                            itemText: controller.nodes[index]
                                                ['recurrence']))),
                          );
                        }
                      }),
                  const SizedBox(
                    height: 100,
                  )
                ],
              ),
            )),
          ),
          GetBuilder(
            init: control,
            builder: (controller) => BottomNavigation(
                disabledBackButton: false,
                disabledNextButton: controller.loading,
                loadingNextButton: false,
                nextFunction: () {
                  if (widget.input.residential) {
                    if (widget
                            .input.servicetype!.connect!.abbreviation!.exact ==
                        'RC') {
                      Get.to(() => AppointmentPage(
                            input: widget.input,
                          ));
                    } else {
                      Get.to(() => BedroomsNumberPage(
                            input: widget.input,
                          ));
                    }
                  } else {
                    Get.to(() => SquareFootagePage(
                          input: widget.input,
                        ));
                  }
                }),
          ),
        ],
      ),
    );
  }
}
