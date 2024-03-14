import 'package:cleanserv/pages/stepper/residential_cleaning/appointment/appointment_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:cleanserv/environment.dart';
import '../../pages/stepper/residential_cleaning/appointment/apppointment_controller.dart';

final HttpLink httpLink = HttpLink(Environment.endpoint);

final ValueNotifier<GraphQLClient> client = ValueNotifier<GraphQLClient>(
  GraphQLClient(
    link: httpLink,
    cache: GraphQLCache(),
  ),
);

class BottomNavigationSchedule extends StatefulWidget {
  const BottomNavigationSchedule({
    super.key,
    required this.nextFunction,
    required this.focusedDate,
  });
  final Function nextFunction;
  final DateTime focusedDate;

  @override
  State<BottomNavigationSchedule> createState() =>
      _BottomNavigationScheduleState();
}

int selectedIndex = 0;
bool flag = true;

class _BottomNavigationScheduleState extends State<BottomNavigationSchedule> {
  int timeSelected = 0;
  AppointmentController controller = AppointmentController();

  @override
  void initState() {
    super.initState();
    controller.enabledHoursQuery(widget.focusedDate);
  }

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    final width = screen.width;
    return GraphQLProvider(
      client: client,
      child: Positioned(
          bottom: 1,
          child: Container(
            height: 300,
            width: width,
            decoration: ShapeDecoration(
              color: Colors.white.withOpacity(0.9),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              shadows: const [
                BoxShadow(
                  color: Color(0x19000000),
                  blurRadius: 70,
                  offset: Offset(0, -10),
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    "What time do you want us to serve you?",
                    textAlign: TextAlign.center,
                    softWrap: true,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        fontFamily: 'Roboto',
                        color: Color.fromRGBO(21, 30, 50, 0.8)),
                  ),
                  // Query(
                  //   options: QueryOptions(
                  //     document: gql(gql_str.getEnabledHours),
                  //     variables: {
                  //       'date':
                  //           DateFormat("yyyy-MM-dd").format(widget.focusedDate),
                  //     },
                  //   ),
                  //   builder: (result, {fetchMore, refetch}) {
                  //     if (result.hasException) {
                  //       // print(result.exception);
                  //       return const Center(
                  //         child: Text('Error loading availables dates.'),
                  //       );
                  //     }

                  //     if (result.isLoading) {
                  //       return const Center(
                  //         child: CircularProgressIndicator(),
                  //       );
                  //     }

                  //     if (result.data != null) {
                  //       List<dynamic> nodes =
                  //           result.data?['getEnabledHours']?['hours'] ?? [];
                  //       if (flag) {
                  //         flag = false;
                  //         time = nodes[0];
                  //       }
                  //       if (nodes.isNotEmpty) {
                  //         return;
                  //       } else {
                  //         return const Center(
                  //           child: Text(
                  //               'Disable Day, please make your reservation for another day.'),
                  //         );
                  //       }
                  //     } else {
                  //       return const Center(
                  //         child: Text('Error loading availables dates.'),
                  //       );
                  //     }
                  //   },
                  // ),
                  GetBuilder<AppointmentController>(
                    init: controller,
                    builder: (controller) {
                      if (controller.loading) {
                        return const CircularProgressIndicator();
                      } else {
                        if (flag) {
                          flag = false;
                          time = controller.nodes[0];
                        }
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            controller.nodes.length,
                            (index) => GestureDetector(
                              onTap: () {
                                setState(() {
                                  time = controller.nodes[index];
                                  timeSelected = index;
                                });
                              },
                              child: Row(
                                children: [
                                  Container(
                                    height: 60,
                                    width: 32,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: timeSelected == index
                                            ? const Color.fromRGBO(
                                                89, 38, 166, 1)
                                            : const Color.fromRGBO(
                                                212, 224, 237, 0.5)),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 6, horizontal: 6),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  controller.nodes[index]
                                                      .toString()
                                                      .substring(0, 2),
                                                  softWrap: true,
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily: 'Roboto',
                                                      color:
                                                          timeSelected == index
                                                              ? Colors.white
                                                              : Colors.black),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "00",
                                                  softWrap: true,
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily: 'Roboto',
                                                      color:
                                                          timeSelected == index
                                                              ? Colors.white
                                                              : Colors.black),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }
                    },
                  ),
                  Container(
                    width: width * 0.9,
                    height: 45,
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(21, 30, 51, 0.08),
                        borderRadius: BorderRadius.circular(30)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 25, right: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 8,
                            child: TextFormField(
                              onChanged: (value) {
                                additionalNote = value;
                              },
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Leave a note",
                                  hintStyle: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w400,
                                      color: Color.fromRGBO(21, 30, 51, 0.4))),
                            ),
                          ),
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                color: const Color.fromRGBO(21, 30, 51, 0.25),
                                borderRadius: BorderRadius.circular(30)),
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: GestureDetector(
                                onTap: () {},
                                child:
                                    Image.asset("assets/images/notes_icon.png"),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: const Text(
                            'Go Back',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400),
                          )),
                      GetBuilder(
                        init: controller,
                        builder: (controller) => GestureDetector(
                          onTap: () =>
                              controller.loading ? null : widget.nextFunction(),
                          child: Container(
                            height: 50.0,
                            width: 142.0,
                            padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                            decoration: ShapeDecoration(
                              color: const Color.fromARGB(255, 225, 229, 234),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  'Next',
                                  style: TextStyle(
                                    color: Color(0xFF151E33),
                                    fontSize: 16,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: -0.56,
                                  ),
                                ),
                                const SizedBox(width: 29),
                                Stack(
                                  children: [
                                    Container(
                                      width: 40,
                                      height: 40,
                                      decoration: const BoxDecoration(
                                        color: Color(0xFF5926A6),
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    const Positioned.fill(
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Icon(
                                          Icons.arrow_forward,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
