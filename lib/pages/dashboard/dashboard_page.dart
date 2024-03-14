// import 'package:cleanserv/environment.dart';
// ignore_for_file: avoid_print

import 'dart:ui';

import 'package:cleanserv/pages/dashboard/dashboard_controller.dart';
import 'package:cleanserv/pages/profile/profile_page.dart';
import 'package:cleanserv/widgets/main_services.dart';
import 'package:cleanserv/widgets/image_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
// import 'package:http/http.dart' as http;
import 'package:cleanserv/graphql_strings.dart' as gql_str;
import 'package:flutter_svg/flutter_svg.dart';
import '../../widgets/services/complementary_service.dart';
import 'package:intl/intl.dart';
// import 'package:get/get_connect/http/src/response/response.dart'
// as getConnectResponse;

class DashboardPage extends GetWidget<DashboardController> {
  DashboardPage({super.key});

  final List<Widget> pages = [
    const ServicesPage(),
    const HistoryPage(),
    const SettingsPage(),
  ];
  final Color bodyColor = const Color.fromARGB(188, 247, 241, 241);

  @override
  Widget build(BuildContext context) {
    // FlutterStatusbarcolor.setStatusBarColor(Colors.transparent);
    // FlutterStatusbarcolor.setNavigationBarColor(Colors.transparent);
    // FlutterStatusbarcolor.setStatusBarWhiteForeground(false);
    final screen = MediaQuery.of(context).size;
    final width = screen.width;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.transparent,
      // systemNavigationBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    return WillPopScope(
      onWillPop: () async {
        final result = await controller.exitApp(context);
        return result;
      },
      child: Scaffold(
        extendBody: true,
        body: SingleChildScrollView(
          child: Stack(
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
              // Contenedor con efecto de desenfoque
              BackdropFilter(
                filter: ImageFilter.blur(
                    sigmaX: 15,
                    sigmaY:
                        15), // Ajusta los valores de sigmaX y sigmaY según tus necesidades
                child: Container(
                  width: width,
                  color: Colors.white.withOpacity(
                      0.75), // Ajusta la opacidad según tus necesidades
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: SafeArea(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 40),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    height: 24,
                                    child: SvgPicture.asset(
                                      'assets/images/logo.svg', // Reemplaza 'ruta_del_svg' con la ruta correcta de tu archivo SVG
                                      width: 72.86,
                                      height: 24,
                                      // fit: BoxFit.fill,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 20),
                                    child: SvgPicture.asset(
                                      'assets/images/jam_menu.svg', // Reemplaza 'ruta_del_svg' con la ruta correcta de tu archivo SVG
                                      width: 24,
                                      height: 24,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 60,
                              ),
                              const Text(
                                'Take the day off,',
                                style: TextStyle(
                                  color: Color(0x66151E32),
                                  fontSize: 30,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w500,
                                  height: 0.04,
                                  letterSpacing: -1.05,
                                ),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                'today we clean',
                                style: TextStyle(
                                  color: Color(0x99151E32),
                                  fontSize: 45,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w800,
                                  height: 1.0,
                                  letterSpacing: -1.57,
                                ),
                              ),
                              const SizedBox(height: 40),
                              const MainServices(),
                              const SizedBox(height: 40),
                              const Text(
                                'Complementary services',
                                style: TextStyle(
                                  color: Color(0xFF151E33),
                                  fontSize: 24,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w500,
                                  height: 0.05,
                                  letterSpacing: -0.84,
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              const ComplementaryService(
                                  title1: 'Windows Cleaning (interior)',
                                  title2: 'Oven cleaning',
                                  imagePath1:
                                      'assets/images/washing_window.png',
                                  imagePath2:
                                      'assets/images/washing_machine.png'),
                              const SizedBox(
                                height: 10,
                              ),
                              const ComplementaryService(
                                  title1: 'Fridge Cleaning',
                                  title2: 'Laundry',
                                  imagePath1: 'assets/images/friedge.png',
                                  imagePath2: 'assets/images/laundry.png'),
                              const SizedBox(
                                height: 10,
                              ),
                              const ComplementaryService(
                                  title1: 'Dishwashing',
                                  imagePath1: 'assets/images/dishwashing.png'),
                              const SizedBox(
                                height: 100,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          height: 90,
          decoration: ShapeDecoration(
            color: Colors.white.withOpacity(0.4),
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // buildBottomNavItem(
              //   Icons.real_estate_agent,
              //   'Services',
              //   0,
              // ),
              const ChatButton(),
              // Stack(
              //   children: [

              //     Container(
              //       width: 30,
              //       height: 30,
              //       clipBehavior: Clip.antiAlias,
              //       decoration: const BoxDecoration(
              //         color: Colors.transparent,
              //         shape: BoxShape.circle,
              //       ),
              //     ),
              //     Positioned.fill(
              //       child: Align(
              //         alignment: Alignment.center,
              //         child: SvgPicture.asset(
              //           'assets/images/system-uicons_files-history.svg', // Reemplaza 'ruta_del_svg' con la ruta correcta de tu archivo SVG
              //           // width: 24,
              //           // height: 24,
              //         ),
              //       ),
              //     ),

              //   ],
              // ),
              Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      // Manejar el evento del ícono aquí
                      print('Ícono presionado');
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const HistoryPage(),
                      ));
                    },
                    child: Container(
                      width: 30,
                      height: 30,
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(
                        color: Colors.transparent,
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset(
                        'assets/images/system-uicons_files-history.svg', // Reemplaza 'ruta_del_svg' con la ruta correcta de tu archivo SVG
                        // width: 24,
                        // height: 24,
                      ),
                    ),
                  ),
                ],
              ),
              // buildBottomNavItem(
              //   Icons.history,
              //   'History',
              //   1,
              // ),
              // buildBottomNavItem(
              //   Icons.settings,
              //   'Settings',
              //   2,
              // ),
              Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(const ProfilePage());
                    },
                    child: Container(
                      width: 30,
                      height: 30,
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(
                        color: Colors.transparent,
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset(
                        'assets/images/solar_user-line-duotone.svg', // Reemplaza 'ruta_del_svg' con la ruta correcta de tu archivo SVG
                        // width: 24,
                        // height: 24,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      // Scaffold(
      //   extendBody: true,
      //   appBar: AppBar(
      //     backgroundColor: Colors.transparent,
      //     // toolbarOpacity: 0,
      //     elevation: 0,
      //     flexibleSpace: Container(
      //       color: Colors.white,
      //     ),
      //     leading: SvgPicture.asset(
      //       'assets/images/logo.svg', // Reemplaza 'ruta_del_svg' con la ruta correcta de tu archivo SVG
      //       width: 72.86,
      //       height: 24,
      //       // fit: BoxFit.fill,
      //     ),

      //     actions: [
      //       Padding(
      //         padding: const EdgeInsets.only(right: 20.0),
      //         child: SvgPicture.asset(
      //           'assets/images/jam_menu.svg', // Reemplaza 'ruta_del_svg' con la ruta correcta de tu archivo SVG
      //           width: 24,
      //           height: 24,
      //         ),

      //       ),
      //     ],
      //   ),
      //   body: Container(),

      //   // Obx(() => pages[controller.currentIndex.value]),
      //   // const SettingsPage(),
      // bottomNavigationBar: Container(
      //   height: 90,
      //   decoration: const ShapeDecoration(
      //     color: Colors.white, //.withOpacity(0.9),
      //     shape: RoundedRectangleBorder(
      //       borderRadius: BorderRadius.only(
      //         topLeft: Radius.circular(30),
      //         topRight: Radius.circular(30),
      //       ),
      //     ),
      //     shadows: [
      //       BoxShadow(
      //         color: Color(0x19000000),
      //         blurRadius: 70,
      //         offset: Offset(0, -10),
      //         spreadRadius: 0,
      //       ),
      //     ],
      //   ),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceAround,
      //     children: [
      //       buildBottomNavItem(
      //         Icons.real_estate_agent,
      //         'Services',
      //         0,
      //       ),
      //       buildBottomNavItem(
      //         Icons.history,
      //         'History',
      //         1,
      //       ),
      //       buildBottomNavItem(
      //         Icons.settings,
      //         'Settings',
      //         2,
      //       ),
      //     ],
      //   ),
      // ),
      // ),
    );
  }
}

class ChatButton extends GetWidget<DashboardController> {
  const ChatButton({
    Key? key,
  }) : super(key: key);

  // final LoginController loginController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 169,
      child: GestureDetector(
        onTap: () async {
          // if (!controller.isLoading.value) {
          //   await controller.onLogin();
          // }
        },
        child: Container(
          padding: const EdgeInsets.only(right: 5),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Obx(
              //   () => controller.isLoading.value
              //       ? Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           mainAxisAlignment: MainAxisAlignment.center,
              //           children: const [
              //             Padding(
              //               padding: EdgeInsets.only(left: 36),
              //               child: SizedBox(
              //                 width: 30,
              //                 height: 30,
              //                 child: CircularProgressIndicator(
              //                   strokeWidth: 3,
              //                   color: Colors.white,
              //                 ),
              //               ),
              //             ),
              //           ],
              //         )
              //       : Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           mainAxisAlignment: MainAxisAlignment.center,
              //           children: const [
              //             Padding(
              //               padding: EdgeInsets.only(left: 36),
              //               child: Text(
              //                 'Log in',
              //                 style: TextStyle(
              //                   color: Color(0xFFD4E0ED),
              //                   fontSize: 16,
              //                   fontFamily: 'Roboto',
              //                   fontWeight: FontWeight.w700,
              //                   letterSpacing: -0.56,
              //                 ),
              //               ),
              //             ),
              //           ],
              //         ),
              // ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 19.5),
                    child: Text(
                      'Chat with us',
                      style: TextStyle(
                        color: Color(0xFF151E33),
                        fontSize: 16,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                        height: 0,
                        letterSpacing: -0.56,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.center,
                          child: SvgPicture.asset(
                            'assets/images/fluent_chat-12-regular.svg', // Reemplaza 'ruta_del_svg' con la ruta correcta de tu archivo SVG
                            width: 24,
                            height: 24,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildBottomNavItem(IconData icon, String title, int index) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Stack(
        alignment: Alignment.center,
        children: [
          Obx(() => IconButton(
                onPressed: () {
                  Get.find<DashboardController>().changePage(index);
                },
                icon: Icon(icon, size: 35),
                color:
                    Get.find<DashboardController>().currentIndex.value == index
                        ? const Color(0xFF5926A6)
                        : Colors.grey.shade600,
              )),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                Get.find<DashboardController>().changePage(index);
              },
              splashColor: Colors.blue.withOpacity(0.3),
              borderRadius: BorderRadius.circular(35),
              child: const SizedBox(
                width: 40,
                height: 40,
              ),
            ),
          ),
        ],
      ),
      Obx(() => InkWell(
            onTap: () {
              Get.find<DashboardController>().changePage(index);
            },
            child: RichText(
              text: TextSpan(
                text: title,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Get.find<DashboardController>().currentIndex.value ==
                          index
                      ? const Color(0xFF5926A6)
                      : Colors.grey.shade600,
                ),
              ),
            ),
          )),
    ],
  );
}

class ServicesPage extends GetWidget<DashboardController> {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<GraphQLClient> client = ValueNotifier(
      GraphQLClient(
        cache: GraphQLCache(),
        link: controller.httpLink,
      ),
    );
    return GraphQLProvider(
        client: client,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('What kind of cleaning do you need?'),
          ),
          body: Query(
            options: QueryOptions(
              document: gql(gql_str.serviceTypesQuery),
            ),
            builder: (QueryResult<Object?> result,
                {VoidCallback? refetch, FetchMore? fetchMore}) {
              if (result.hasException) {
                // print(result.exception);
                return const Center(
                  child: Text('Error loading service types.'),
                );
              }

              if (result.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (result.data != null) {
                List<dynamic> nodes =
                    result.data?['servicetypes']?['nodes'] ?? [];
                return GridView.count(
                  crossAxisCount: 2,
                  children: List.generate(nodes.length, (index) {
                    final serviceType = nodes[index];
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Card(
                        elevation: 8.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: ListTile(
                                title: Text(
                                  serviceType['servicetype'],
                                  style: const TextStyle(
                                    color: Color(0xFF1C1C1C),
                                    fontSize: 24,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w600,
                                    height: 0.04,
                                    letterSpacing: -0.84,
                                  ),
                                ),
                                subtitle: const Text("Clean Services"),
                                // trailing: const Icon(Icons.favorite_outline),
                                onTap: () {
                                  Get.toNamed('/stepper', arguments: {
                                    'serviceId': serviceType['id']
                                  });
                                },
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 10.0, bottom: 10.0),
                                child: TextButton(
                                  child: const Text('Learn More'),
                                  onPressed: () {/* ... */},
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ); // Add a default return statement
              } else {
                return const Center(
                  child: Text('Error loading service types.'),
                );
              }
              // print("Srvicios " + serviceTypes);
            },
          ),
        ));
  }
}

class HistoryPage extends GetWidget<DashboardController> {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    // final Link link = controller.authLink.concat(httpLink);
    final screen = MediaQuery.of(context).size;
    final width = screen.width;
    final heigth = screen.height;
    final ValueNotifier<GraphQLClient> client = ValueNotifier(
      GraphQLClient(
        cache: GraphQLCache(),
        link: controller.link,
      ),
    );
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
              SafeArea(
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 25, right: 25),
                      child: Stack(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'History',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color.fromRGBO(21, 30, 50, 0.8),
                                    fontWeight: FontWeight.w800,
                                    fontSize: 36,
                                    fontFamily: 'Roboto'),
                              ),
                            ],
                          ),
                          Container(
                            height: 55,
                            width: 55,
                            alignment: Alignment.center,
                            child: InkWell(
                              onTap: () {
                                Get.toNamed('/dashboard');
                              },
                              child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    color:
                                        const Color.fromRGBO(21, 30, 51, 0.08),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Icon(
                                        Icons.arrow_back_ios,
                                        size: 30,
                                      ),
                                    ],
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: width,
                      height: heigth * 0.85,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 25, right: 25),
                        child: Query(
                          options: QueryOptions(
                            document: gql(gql_str.getReservations),
                          ),
                          builder: (QueryResult<Object?> result,
                              {VoidCallback? refetch, FetchMore? fetchMore}) {
                            if (result.hasException) {
                              // print(result.exception);
                              return const Center(
                                child: Text('Error loading service types.'),
                              );
                            }

                            if (result.isLoading) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }

                            if (result.data != null) {
                              // print(result.data);
                              List<dynamic> nodes =
                                  result.data?['services']?['nodes'] ?? [];
                              // print("Lenght: " + nodes.length.toString());
                              // print("Rating: " + nodes[1]['rating'].toString());
                              return ListView.builder(
                                itemCount: nodes.length,
                                itemBuilder: (context, index) {
                                  final service = nodes[index];
                                  // return Card(
                                  //   child: ListTile(
                                  //     title: Text(serviceType['servicetype']),
                                  //     subtitle: Text(serviceType['description']),
                                  //   ),
                                  // );
                                  Color getColorFromStatus(int status) {
                                    switch (status) {
                                      case 1:
                                        return Colors.yellow;
                                      case 2:
                                        return Colors.green;
                                      case 3:
                                        return Colors.green;
                                      case 4:
                                        return Colors.red;
                                      case 5:
                                        return Colors.purple;
                                      default:
                                        return Colors.grey;
                                    }
                                  }

                                  String getStatusText(int status) {
                                    switch (status) {
                                      case 1:
                                        return 'Reserved';
                                      case 2:
                                        return 'Paid';
                                      case 3:
                                        return 'Done';
                                      case 4:
                                        return 'Cancelled';
                                      case 5:
                                        return 'Finalized';
                                      default:
                                        return '';
                                    }
                                  }

                                  int status = service['status'];
                                  // ignore: unused_local_variable
                                  bool showAdditionalTexts = status == 3;

                                  return Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        color:
                                            Color.fromRGBO(76, 34, 141, 0.13),
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(30),
                                          bottomRight: Radius.circular(30),
                                          topRight: Radius.circular(30),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Image.asset(
                                                  "assets/images/menu-dots.png",
                                                  width: 18,
                                                  height: 4,
                                                )
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Icon(Icons.circle,
                                                    size: 8,
                                                    color: getColorFromStatus(
                                                        service['status'])),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  DateFormat('h:mm a').format(
                                                      DateTime.parse(
                                                          service['date'])),
                                                  style: const TextStyle(
                                                      color: Color.fromRGBO(
                                                          21, 30, 51, 0.5),
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 14,
                                                      // height: 23,
                                                      fontFamily: 'Roboto'),
                                                )
                                              ],
                                            ),
                                            Text(
                                              DateFormat('dd MMMM').format(
                                                  DateTime.parse(
                                                      service['date'])),
                                              style: const TextStyle(
                                                color: Color(0xFF1C1C1C),
                                                fontSize: 24,
                                                fontFamily: 'Roboto',
                                                fontWeight: FontWeight.w600,
                                                // height: 0.04,
                                                letterSpacing: -0.84,
                                              ),
                                            ),

                                            Text(
                                              service['address']['address'],
                                              style: const TextStyle(
                                                color: Color.fromRGBO(
                                                    21, 30, 51, 1),
                                                fontSize: 11,
                                                fontFamily: 'Roboto',
                                                fontWeight: FontWeight.w400,
                                                // height: 0.04,
                                                letterSpacing: -0.84,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                Image.asset(
                                                  'assets/images/deep_cleaning.png',
                                                  height: 19,
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Expanded(
                                                  flex: 6,
                                                  child: Column(
                                                    children: [
                                                      Text(
                                                        service['servicetype']
                                                            ['servicetype'],
                                                        softWrap: true,
                                                        style: const TextStyle(
                                                            color:
                                                                Color.fromRGBO(
                                                                    21,
                                                                    30,
                                                                    51,
                                                                    1),
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize: 14,
                                                            // height: 23,
                                                            fontFamily:
                                                                'Roboto'),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Expanded(
                                                  flex: 2,
                                                  child: Container(
                                                    height: 15,
                                                    width: 51,
                                                    decoration: BoxDecoration(
                                                        color: const Color
                                                                .fromRGBO(
                                                            21, 30, 51, 0.2),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10)),
                                                    child: Center(
                                                      child: Text(
                                                        getStatusText(status),
                                                        style: const TextStyle(
                                                          color: Color.fromRGBO(
                                                              21, 30, 51, 1),
                                                          fontSize: 10,
                                                          fontFamily: 'Roboto',
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          // height: 9,
                                                          // letterSpacing: -3.5,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),

                                            //  SizedBox(
                                            //    height: 200.0,
                                            //    child: Ink.image(
                                            //      image: cardImage,
                                            //      fit: BoxFit.cover,
                                            //    ),
                                            //  ),
                                            // Padding(
                                            //   padding: const EdgeInsets.all(16.0),
                                            //   child: Align(
                                            //     alignment: Alignment.centerLeft,
                                            //     child: Text(
                                            //       "\$${service['totalprice'].toStringAsFixed(2)}",
                                            //       style: const TextStyle(
                                            //         fontSize: 32,
                                            //         fontWeight: FontWeight.bold,
                                            //         color: Colors.black,
                                            //       ),
                                            //     ),
                                            //   ),
                                            // ),
                                            // Expanded(
                                            //   child: Container(
                                            //     color: Colors.grey[200],
                                            //     child: Align(
                                            //       alignment: Alignment.center,
                                            //       child: Text(
                                            //         "\$${service['totalprice']}",
                                            //         style: const TextStyle(
                                            //           fontSize: 32,
                                            //           fontWeight: FontWeight.bold,
                                            //           color: Colors.black,
                                            //         ),
                                            //       ),
                                            //     ),
                                            //   ),
                                            // ),
                                            // ButtonBar(
                                            //   children: [
                                            //     // TextButton(
                                            //     //   child: const Text('RESERVE NOW'),
                                            //     //   onPressed: () {/* ... */},
                                            //     // ),
                                            //     // TextButton(
                                            //     //   child: const Text('LEARN MORE'),
                                            //     //   onPressed: () {/* ... */},
                                            //     // )
                                            //     if (showAdditionalTexts) ...[
                                            //       SizedBox(height: 8.0),
                                            //       Text(
                                            //         'Ver factura',
                                            //         style: TextStyle(
                                            //           fontSize: 12.0,
                                            //           fontWeight: FontWeight.normal,
                                            //         ),
                                            //       ),
                                            //       SizedBox(height: 8.0),
                                            //       Text(
                                            //         'Pagar factura',
                                            //         style: TextStyle(
                                            //           fontSize: 12.0,
                                            //           fontWeight: FontWeight.normal,
                                            //         ),
                                            //       ),
                                            //     ],
                                            //     ElevatedButton(
                                            //       style: ElevatedButton.styleFrom(
                                            //         shape: RoundedRectangleBorder(
                                            //           borderRadius: BorderRadius.circular(20.0),
                                            //         ),
                                            //         backgroundColor:
                                            //             getColorFromStatus(service['status']),
                                            //       ),
                                            //       onPressed: () {/* ... */},
                                            //       child: Text(
                                            //         getStatusText(service['status']),
                                            //         style: const TextStyle(
                                            //           fontSize: 16.0,
                                            //           fontWeight: FontWeight.bold,
                                            //         ),
                                            //       ),
                                            //     ),
                                            //   ],
                                            // )
                                            // ButtonBar(
                                            //   children: [
                                            //     if (showAdditionalTexts) ...[
                                            //       ElevatedButton(
                                            //         style: ElevatedButton.styleFrom(
                                            //           shape: RoundedRectangleBorder(
                                            //             borderRadius:
                                            //                 BorderRadius.circular(
                                            //                     20.0),
                                            //           ),
                                            //           backgroundColor: Colors
                                            //               .blue, // Color predeterminado para los botones
                                            //         ),
                                            //         onPressed: () {
                                            //           // Acción del botón "Ver factura"
                                            //         },
                                            //         child: const Text(
                                            //           'Ver factura',
                                            //           style: TextStyle(
                                            //             fontSize: 12.0,
                                            //             fontWeight: FontWeight.normal,
                                            //           ),
                                            //         ),
                                            //       ),
                                            //       ElevatedButton(
                                            //         style: ElevatedButton.styleFrom(
                                            //           shape: RoundedRectangleBorder(
                                            //             borderRadius:
                                            //                 BorderRadius.circular(
                                            //                     20.0),
                                            //           ),
                                            //           backgroundColor: Colors
                                            //               .blue, // Color predeterminado para los botones
                                            //         ),
                                            //         onPressed: () {
                                            //           // Acción del botón "Pagar factura"
                                            //         },
                                            //         child: const Text(
                                            //           'Pagar factura',
                                            //           style: TextStyle(
                                            //             fontSize: 12.0,
                                            //             fontWeight: FontWeight.normal,
                                            //           ),
                                            //         ),
                                            //       ),
                                            //     ],
                                            //     ElevatedButton(
                                            //       style: ElevatedButton.styleFrom(
                                            //         shape: RoundedRectangleBorder(
                                            //           borderRadius:
                                            //               BorderRadius.circular(20.0),
                                            //         ),
                                            //         backgroundColor:
                                            //             getColorFromStatus(
                                            //                 service['status']),
                                            //       ),
                                            //       onPressed: () {
                                            //         // Acción del botón "done"
                                            //       },
                                            //       child: Text(
                                            //         getStatusText(service['status']),
                                            //         style: const TextStyle(
                                            //           fontSize: 16.0,
                                            //           fontWeight: FontWeight.bold,
                                            //         ),
                                            //       ),
                                            //     ),
                                            //   ],
                                            // ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );

                              // return GridView.count(
                              //   crossAxisCount: 2,
                              //   children: List.generate(nodes.length, (index) {
                              //     final serviceType = nodes[index];
                              //     return Padding(
                              //       padding: const EdgeInsets.all(10.0),
                              //       child: Card(
                              //         elevation: 8.0,
                              //         shape: RoundedRectangleBorder(
                              //           borderRadius: BorderRadius.circular(20.0),
                              //         ),
                              //         child: Column(
                              //           crossAxisAlignment: CrossAxisAlignment.start,
                              //           children: [
                              //             Expanded(
                              //               child: ListTile(
                              //                 title: Text(
                              //                   serviceType['servicetype'],
                              //                   style: const TextStyle(
                              //                     color: Color(0xFF1C1C1C),
                              //                     fontSize: 24,
                              //                     fontFamily: 'Roboto',
                              //                     fontWeight: FontWeight.w600,
                              //                     height: 0.04,
                              //                     letterSpacing: -0.84,
                              //                   ),
                              //                 ),
                              //                 subtitle: const Text("Clean Services"),
                              //                 // trailing: const Icon(Icons.favorite_outline),
                              //               ),
                              //             ),
                              //             Align(
                              //               alignment: Alignment.bottomLeft,
                              //               child: Padding(
                              //                 padding: const EdgeInsets.only(
                              //                     left: 10.0, bottom: 10.0),
                              //                 child: TextButton(
                              //                   child: const Text('Learn More'),
                              //                   onPressed: () {/* ... */},
                              //                 ),
                              //               ),
                              //             ),
                              //           ],
                              //         ),
                              //       ),
                              //     );
                              //   }),
                              // ); // Add a default return statement
                            } else {
                              return const Center(
                                child: Text('Error loading service types.'),
                              );
                            }
                            // print("Srvicios " + serviceTypes);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

class SettingsPage extends GetWidget<DashboardController> {
  const SettingsPage({Key? key}) : super(key: key);

  // final DashboardController controller;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Icon(
                    Icons.person_pin,
                    size: 70,
                    color: Colors.grey.shade300,
                  ),
                  const Icon(
                    Icons.edit,
                    size: 20,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
            const Text(
              'Alfredo Blanco',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) => const Divider(
                  color: Colors.grey,
                ),
                itemCount: 10,
                itemBuilder: (context, index) {
                  String title;

                  switch (index) {
                    case 0:
                      title = 'Account';
                      break;
                    case 1:
                      title = 'Notifications';
                      break;
                    case 2:
                      title = 'Refer a friend, get 50% off';
                      break;
                    case 3:
                      title = 'Help';
                      break;
                    case 4:
                      title = 'Privacy Policy';
                      break;
                    case 5:
                      title = 'CA Notice At Collection';
                      break;
                    case 6:
                      title = 'Terms Of Use';
                      break;
                    case 7:
                      title = 'Acknowledgements';
                      break;
                    case 8:
                      title = 'Report A Technical Problem';
                      break;
                    case 9:
                      title = 'Log Out';
                      break;
                    default:
                      title = '';
                  }

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                title,
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                        ),
                        onTap: () {
                          print('Tapped item at index $index');
                          if (index == 9) {
                            // controller.exitApp(context);
                            controller.confirmLogout(context);
                          }
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
