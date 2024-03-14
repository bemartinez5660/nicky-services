// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:ui';

import 'package:cleanserv/models/input.dart';
import 'package:cleanserv/models/result.dart' as res;
import 'package:cleanserv/pages/stepper/commercial_cleaning/all_ready_page.dart';
import 'package:cleanserv/pages/stepper/residential_cleaning/address/address_controller.dart';

import 'package:cleanserv/pages/stepper/residential_cleaning/summary/summary_page.dart';
import 'package:cleanserv/widgets/image_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../widgets/bottom_navigation.dart';
import '../../../../widgets/form_address_item.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({super.key, required this.input});
  final Input input;

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  int _selectedItem = 0;
  bool flag = true;
  AddressController controller = AddressController();

  @override
  void initState() {
    super.initState();
    controller.getAddresses();
  }

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    final width = screen.width;
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                    child: Padding(
                  padding: EdgeInsets.only(top: 25),
                  child: Text(
                    "What is your address?",
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
                //     document: gql(gql_str.getAddresses),
                //   ),
                //   builder: (result, {fetchMore, refetch}) {
                //     if (result.hasException) {
                //       // print(result.exception);
                //       return const Center(
                //         child: Text('Error loading availables addresses.'),
                //       );
                //     }

                //     if (result.isLoading) {
                //       return const Center(
                //         child: CircularProgressIndicator(),
                //       );
                //     }

                //     if (result.data != null) {
                //       List<dynamic> nodes =
                //           result.data?['addresses']['nodes'] ?? [];
                //       if (flag) {
                //         flag = false;
                //         widget.input.address =
                //             Address(create: AddressCreate.fromJson(nodes[0]));
                //         widget.input.address!.create!.email =
                //             "juan@gmail.com";
                //       }
                //     } else {
                //       return const Center(
                //         child: Text('Error loading availables addresses.'),
                //       );
                //     }
                //   },
                // ),
                GetBuilder(
                  init: controller,
                  builder: (controller) {
                    if (controller.loading) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      if (flag) {
                        flag = false;
                        widget.input.address = Address(
                            create:
                                AddressCreate.fromJson(controller.nodes[0]));
                        widget.input.address!.create!.email = "juan@gmail.com";
                      }
                      return SizedBox(
                        height: height * 0.35,
                        child: ListView.builder(
                            itemCount: controller.nodes.length,
                            // physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) => GestureDetector(
                                onTap: () {
                                  setState(() {
                                    widget.input.address = Address(
                                        create: AddressCreate.fromJson(
                                            controller.nodes[index]));
                                    widget.input.address!.create!.email =
                                        "juan@gmail.com";
                                    _selectedItem = index;
                                  });
                                },
                                child: FormAddressItem(
                                    selectedItem: _selectedItem,
                                    index: index,
                                    itemText:
                                        "${controller.nodes[index]['address']}, ${controller.nodes[index]['city']}, ${controller.nodes[index]['country']}"))),
                      );
                    }
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Add address",
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w800,
                    color: Color.fromRGBO(21, 30, 50, 0.4),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: width * 0.9,
                  height: 50,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(28, 28, 28, 0.1),
                      borderRadius: BorderRadius.circular(30)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25, right: 8),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 8,
                          child: TextFormField(
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: "What is your address?",
                                hintStyle: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(21, 30, 51, 1))),
                          ),
                        ),
                        Container(
                          height: 30,
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(28, 28, 28, 0.1),
                              borderRadius: BorderRadius.circular(30)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {},
                              child: Image.asset(
                                  "assets/images/location_icon.png"),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 100,
                )
              ],
            ),
          )),
          GetBuilder(
            init: controller,
            builder: (controller) {
              return BottomNavigation(
                  disabledBackButton: false,
                  disabledNextButton: controller.loading,
                  loadingNextButton: controller.loadingButton,
                  nextFunction: () async {
                    res.Result mutationResult =
                        await controller.createService(widget.input);
                    mutationResult.residential = widget.input.residential;
                    if (widget.input.residential) {
                      Get.to(
                        () => SummaryPage(
                          result: mutationResult,
                        ),
                      );
                    } else {
                      Get.to(() => const AllReadyPage());
                    }
                  });
            },
          )
        ],
      ),
    );
  }
}
