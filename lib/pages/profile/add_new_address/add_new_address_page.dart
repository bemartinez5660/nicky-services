import 'dart:ui';

import 'package:flutter/cupertino.dart';

import '../../../widgets/profile_widgets/profile_form_field.dart';
import 'package:cleanserv/widgets/image_header_widget.dart';
import 'package:flutter/material.dart';

class AddNewAddressPage extends StatefulWidget {
  const AddNewAddressPage({super.key});

  @override
  State<AddNewAddressPage> createState() => _AddNewAddressPageState();
}

class _AddNewAddressPageState extends State<AddNewAddressPage> {
  bool favSwitch = true;
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
                Colors.white.withOpacity(0.7),
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
              padding: const EdgeInsets.all(40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Change password",
                    textAlign: TextAlign.center,
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
                  const ProfileFormField(
                    image: "assets/images/profile_image.png",
                    opacity: 0.15,
                    hintText: "First Name",
                  ),
                  const ProfileFormField(
                    image: "assets/images/profile_image.png",
                    opacity: 0.15,
                    hintText: "Last Name",
                  ),
                  const ProfileFormField(
                    image: "assets/images/phone.png",
                    opacity: 0.15,
                    hintText: "Phone number",
                  ),
                  const ProfileFormField(
                    image: "assets/images/location_icon.png",
                    opacity: 0.15,
                    hintText: "Address Line 1",
                  ),
                  const ProfileFormField(
                    image: "assets/images/location_icon.png",
                    opacity: 0.15,
                    hintText: "Address Line 2",
                  ),
                  const ProfileFormField(
                    image: "assets/images/location_icon.png",
                    opacity: 0.15,
                    hintText: "91030",
                  ),
                  const ProfileFormField(
                    image: "assets/images/location_icon.png",
                    opacity: 0.15,
                    hintText: "South Pasadena",
                  ),
                  const ProfileFormField(
                    image: "assets/images/location_icon.png",
                    opacity: 0.15,
                    hintText: "CA-California",
                  ),
                  const ProfileFormField(
                    image: "assets/images/location_icon.png",
                    opacity: 0.15,
                    hintText: "United States",
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Favorite",
                        style: TextStyle(
                          color: Color.fromRGBO(65, 65, 65, 1),
                          fontSize: 14,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                          height: 0,
                          letterSpacing: -0.56,
                        ),
                      ),
                      Transform.scale(
                        scale: 0.7,
                        child: CupertinoSwitch(
                          value: favSwitch,
                          activeColor: Color.fromRGBO(21, 30, 51, 1),
                          onChanged: (val) {
                            setState(() {
                              favSwitch = val;
                            });
                          },
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {},
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
                                color: Color.fromRGBO(21, 30, 51, 1),
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
                                  child:
                                      Image.asset("assets/images/map_pin.png"),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )),
          ),
        ],
      ),
    );
  }
}
