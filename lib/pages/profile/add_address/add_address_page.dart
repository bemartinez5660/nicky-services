import 'dart:ui';

import 'package:cleanserv/pages/profile/add_new_address/add_new_address_page.dart';
import 'package:cleanserv/pages/stepper/residential_cleaning/address/address_controller.dart';
import 'package:cleanserv/widgets/image_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAddressPage extends StatefulWidget {
  const AddAddressPage({super.key});

  @override
  State<AddAddressPage> createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {
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
            padding: const EdgeInsets.all(40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Address",
                  style: TextStyle(
                    color: Color.fromRGBO(21, 30, 50, 0.8),
                    fontSize: 24,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w800,
                    letterSpacing: -0.56,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                GetBuilder(
                  init: controller,
                  builder: (controller) {
                    if (controller.loading) {
                      return Center(
                          child: Column(
                        children: const [
                          CircularProgressIndicator(),
                          SizedBox(
                            height: 40,
                          )
                        ],
                      ));
                    } else {
                      return SizedBox(
                        height: height * 0.35,
                        child: ListView.builder(
                            itemCount: controller.nodes.length,
                            itemBuilder: (context, index) => ListTile(
                                  title: Text(
                                    "${controller.nodes[index]['address']}, ${controller.nodes[index]['city']}, ${controller.nodes[index]['country']}",
                                    style: const TextStyle(
                                      color: Color.fromRGBO(0, 4, 12, 0.698),
                                      fontSize: 11,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: -0.56,
                                    ),
                                  ),
                                  trailing: Container(
                                    width: 30,
                                    height: 30,
                                    // padding: EdgeInsets.only(left: 10),
                                    decoration: const ShapeDecoration(
                                      color: Color.fromRGBO(21, 30, 51, 0.05),
                                      shape: OvalBorder(),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(7.0),
                                      child: Image.asset(
                                        "assets/images/trash_icon.png",
                                      ),
                                    ),
                                  ),
                                )),
                      );
                    }
                  },
                ),
                List.generate(length, (index) => null)
                GestureDetector(
                  onTap: () {
                    Get.to(AddNewAddressPage());
                  },
                  child: Container(
                    width: width * 0.8,
                    height: 50,
                    decoration: ShapeDecoration(
                      color: const Color(0xFFF4F9FF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 25),
                          child: const Text(
                            'Add',
                            style: TextStyle(
                              color: Color.fromRGBO(89, 38, 166, 1),
                              fontSize: 16,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w700,
                              height: 0,
                              letterSpacing: -0.56,
                            ),
                          ),
                        ),
                        Container(
                          width: 40,
                          height: 40,
                          margin: const EdgeInsets.only(right: 8),
                          decoration: const ShapeDecoration(
                            color: Color.fromRGBO(89, 38, 166, 1),
                            shape: OvalBorder(),
                          ),
                          child: Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.all(7.0),
                                child: Image.asset("assets/images/map_pin.png"),
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
