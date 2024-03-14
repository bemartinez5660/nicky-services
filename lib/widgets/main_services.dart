// ignore_for_file: camel_case_types

import 'package:cleanserv/pages/stepper/commercial_cleaning/commercial_type_of_service/commercial_type_of_service.dart';
import 'package:cleanserv/pages/stepper/residential_cleaning/type_of_service/type_of_service_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainServices extends StatelessWidget {
  const MainServices({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    final width = screen.width;
    return SizedBox(
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            children: [
              Container(
                width: width * 0.43,
                height: 212,
                padding: const EdgeInsets.all(15),
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(21, 30, 51, 0.04),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                    topLeft: Radius.circular(30.0),
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset('assets/images/building.png', height: 55),
                      Column(
                        children: const [
                          Text(
                            'Commercial',
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Roboto',
                                color: Color.fromRGBO(28, 28, 28, 1)),
                          ),
                          Text(
                            'cleaning',
                            textAlign: TextAlign.center,
                            softWrap: true,
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Roboto',
                                color: Color.fromRGBO(28, 28, 28, 1)),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      // Boton deslizante
                      HireButton(tap: () {
                        // Get.to();
                        Get.to(const CommercialTypeOfServicePage(residential: false,));
                      }),
                      //boton deslizante
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 20,
          ),

          // Segundo card
          Stack(
            children: [
              Container(
                width: width * 0.43,
                height: 212,
                padding: const EdgeInsets.all(15),
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(21, 30, 51, 0.04),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset('assets/images/house.png', height: 55),
                      Column(
                        children: const [
                          Text('Residential',
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Roboto',
                                  color: Color.fromRGBO(28, 28, 28, 1))),
                          Text('cleaning',
                              textAlign: TextAlign.center,
                              softWrap: true,
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Roboto',
                                  color: Color.fromRGBO(28, 28, 28, 1))),
                        ],
                      ),

                      const SizedBox(
                        height: 8,
                      ),
                      // Boton deslizante
                      HireButton(tap: () {
                        Get.to(const TypeOfServicePage(residential: true,));
                      }),
                      //boton deslizante
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class HireButton extends StatelessWidget {
  const HireButton({
    super.key,
    required this.tap,
  });
  final Function tap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => tap(),
      borderRadius: const BorderRadius.all(Radius.circular(30)),
      splashColor: Colors.black,
      child: Container(
        width: 150,
        height: 40,
        decoration: const BoxDecoration(
            color: Color.fromRGBO(21, 30, 51, 0.1),
            borderRadius: BorderRadius.all(Radius.circular(80))),
        child: Padding(
          padding: const EdgeInsets.only(left: 13, top: 8, bottom: 8, right: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Hire service',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Roboto',
                    color: Color.fromRGBO(21, 30, 51, 0.5)),
              ),
              Container(
                width: 23,
                height: 23,
                decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: const Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
