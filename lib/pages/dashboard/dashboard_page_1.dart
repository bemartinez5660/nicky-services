// import 'package:cleanserv/pages/dashboard/dashboard_controller.dart';
// // import 'package:cleanserv/themes/app_colors.dart';
// import 'package:flutter/material.dart';
// // import 'package:flutter/services.dart';
// // import 'package:cleanserv/pages/login_page.dart';
// // import 'package:cleanserv/pages/splash_screen.dart';
// import 'package:cleanserv/widgets/header_widget.dart';
// // import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:get/get.dart';

// // import '../forgot/forgot_page.dart';
// // import '../forgot/forgot_verification_page.dart';
// // import '../register/register_page.dart';

// class DashboardPage extends GetWidget<DashboardController> {
//   const DashboardPage({super.key});

//   // final DashboardController dashboardController =
//   //     Get.put(DashboardController());

//   final double _drawerIconSize = 24;
//   final double _drawerFontSize = 17;
//   final bool hasUnreadNotifications = false;
//   // final FlutterSecureStorage _storage = const FlutterSecureStorage();

//   // @override
//   // final controller = Get.find<DashboardController>();

//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async {
//         final result = await controller.onExitApp(context);
//         return (result != null) && result;
//       },
//       child: Stack(
//         children: [
//           Scaffold(
//             appBar: AppBar(
//               title: const Text(
//                 "NickyService",
//                 style:
//                     TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//               ),
//               elevation: 0.5,
//               iconTheme: const IconThemeData(color: Colors.white),
//               flexibleSpace: Container(
//                 decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                         begin: Alignment.topLeft,
//                         end: Alignment.bottomRight,
//                         colors: <Color>[
//                       Theme.of(context).primaryColor,
//                       Theme.of(context).colorScheme.secondary,
//                     ])),
//               ),
//               actions: [
//                 Container(
//                   margin: const EdgeInsets.only(
//                     top: 16,
//                     right: 16,
//                   ),
//                   child: Stack(
//                     children: <Widget>[
//                       SizedBox(
//                         width: 25,
//                         height: 25,
//                         child: ElevatedButton(
//                           onPressed: () {
//                             // Show the logout menu
//                             final RenderBox button =
//                                 context.findRenderObject() as RenderBox;
//                             final RenderBox overlay = Overlay.of(context)!
//                                 .context
//                                 .findRenderObject() as RenderBox;
//                             final Offset topRight = button.localToGlobal(
//                                 button.size.topRight(Offset.zero));
//                             final Offset topLeft = button.localToGlobal(
//                                 button.size.topLeft(Offset.zero));
//                             const double menuHeight = 25;

//                             // final RelativeRect position = RelativeRect.fromLTRB(
//                             //   topRight.dx - 120,
//                             //   topRight.dy + button.size.height + 8,
//                             //   topRight.dx,
//                             //   topLeft.dy + button.size.height + menuHeight + 8,
//                             // );
//                             final RelativeRect position = RelativeRect.fromLTRB(
//                               topRight.dx - 120,
//                               topRight.dy + menuHeight + 40,
//                               menuHeight,
//                               0,
//                             );
//                             showMenu(
//                               context: context,
//                               position: position,
//                               items: [
//                                 const PopupMenuItem(
//                                   value: 'logout',
//                                   child: Text('Logout'),
//                                 ),
//                               ],
//                               elevation: 8.0,
//                             ).then((value) {
//                               if (value == 'logout') {
//                                 // Handle logout here
//                                 controller.logout();
//                               }
//                             });
//                           },
//                           style: ElevatedButton.styleFrom(
//                             padding: EdgeInsets.zero,
//                             backgroundColor: Colors.white,
//                             shape: const CircleBorder(),
//                             elevation: 0,
//                           ),
//                           child: const Icon(
//                             Icons.person,
//                             color: Colors.grey,
//                           ),
//                         ),
//                       ),
//                       if (hasUnreadNotifications) // Replace this with your own logic
//                         Positioned(
//                           right: 0,
//                           child: Container(
//                             padding: const EdgeInsets.all(1),
//                             decoration: BoxDecoration(
//                               color: Colors.red,
//                               borderRadius: BorderRadius.circular(6),
//                             ),
//                             constraints: const BoxConstraints(
//                               minWidth: 12,
//                               minHeight: 12,
//                             ),
//                             child: const Text(
//                               '5',
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 8,
//                               ),
//                               textAlign: TextAlign.center,
//                             ),
//                           ),
//                         ),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//             drawer: Drawer(
//               child: Column(
//                 children: [
//                   SizedBox(
//                     height: 200,
//                     child: Stack(
//                       children: [
//                         const SizedBox(
//                           height: 200,
//                           child:
//                               HeaderWidget(200, false, Icons.house_rounded, ''),
//                         ),
//                         Positioned(
//                           top: 0,
//                           left: 0,
//                           right: 0,
//                           child: Container(
//                             decoration: const BoxDecoration(
//                               color: Colors.transparent,
//                             ),
//                             child: const UserAccountsDrawerHeader(
//                               accountName: Text(
//                                 'NickyServices',
//                                 style: TextStyle(
//                                   fontSize: 25,
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.bold,
//                                   letterSpacing: 1.0,
//                                 ),
//                               ),
//                               accountEmail: Text(
//                                 "support@nickyservices.com",
//                                 style: TextStyle(
//                                   fontSize: 14,
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.normal,
//                                   letterSpacing: 1.0,
//                                 ),
//                               ),
//                               currentAccountPicture: CircleAvatar(
//                                 backgroundColor: Colors.white,
//                                 backgroundImage: AssetImage(
//                                     "assets/images/logo_home_serv.png"),
//                                 foregroundImage: AssetImage(
//                                     "assets/images/logo_home_serv.png"),
//                                 foregroundColor: Colors.transparent,
//                               ),
//                               margin: EdgeInsets.zero,
//                               decoration: BoxDecoration(
//                                 color: Colors.transparent,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   TabBar(
//                     controller: controller.tabController,
//                     unselectedLabelColor: Colors.lightBlue[100],
//                     labelColor: Theme.of(context).colorScheme.secondary,
//                     indicatorWeight: 1,
//                     indicatorColor: Theme.of(context).colorScheme.secondary,
//                     tabs: const [
//                       Tab(
//                         child: Text(
//                           'My Profile',
//                           style: TextStyle(
//                             fontSize: 14,
//                           ),
//                         ),
//                       ),
//                       Tab(
//                         child: Text(
//                           'Admin Profile',
//                           style: TextStyle(
//                             fontSize: 14,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   Expanded(
//                     child: TabBarView(
//                       controller: controller.tabController,
//                       children: [
//                         // Content of Tab 1
//                         MyProfileListView(
//                             drawerIconSize: _drawerIconSize,
//                             drawerFontSize: _drawerFontSize),

//                         // Content of Tab 2
//                         Scrollbar(
//                           // controller: ,
//                           thumbVisibility: false,
//                           // scrollbarOrientation: ScrollbarOrientation.right,
//                           // isAlwaysShown: true,
//                           // thumbColor: Colors.redAccent,
//                           radius: const Radius.circular(20),
//                           thickness: 5,
//                           child: ListView(
//                             padding: EdgeInsets.zero,
//                             children: [
//                               ListTile(
//                                 // leading: Icon(
//                                 //   Icons.dashboard,
//                                 //   size: _drawerIconSize,
//                                 //   color:
//                                 //       Theme.of(context).colorScheme.secondary,
//                                 // ),
//                                 title: Text(
//                                   'Dashboard',
//                                   style: TextStyle(
//                                     fontSize: 17,
//                                     color:
//                                         Theme.of(context).colorScheme.secondary,
//                                   ),
//                                 ),
//                                 trailing: const Icon(
//                                   Icons.arrow_forward_ios,
//                                   color: Colors.black,
//                                 ),
//                                 onTap: () {
//                                   // Navegar a la pantalla de inicio (splash screen)
//                                 },
//                               ),
//                               ListTile(
//                                 leading: Icon(
//                                   Icons.settings_outlined,
//                                   size: _drawerIconSize,
//                                   color:
//                                       Theme.of(context).colorScheme.secondary,
//                                 ),
//                                 title: Text(
//                                   'Settings',
//                                   style: TextStyle(
//                                     fontSize: _drawerFontSize,
//                                     color:
//                                         Theme.of(context).colorScheme.secondary,
//                                   ),
//                                 ),
//                                 onTap: () {
//                                   // Navegar a la página de inicio de sesión (login page)
//                                 },
//                               ),
//                               ListTile(
//                                 leading: Icon(
//                                   Icons.person_outline,
//                                   size: _drawerIconSize,
//                                   color:
//                                       Theme.of(context).colorScheme.secondary,
//                                 ),
//                                 title: Text(
//                                   'Users',
//                                   style: TextStyle(
//                                     fontSize: _drawerFontSize,
//                                     color:
//                                         Theme.of(context).colorScheme.secondary,
//                                   ),
//                                 ),
//                                 onTap: () {
//                                   // Navegar a la página de registro (registration page)
//                                 },
//                               ),
//                               ListTile(
//                                 leading: Icon(
//                                   Icons.link,
//                                   size: _drawerIconSize,
//                                   color:
//                                       Theme.of(context).colorScheme.secondary,
//                                 ),
//                                 title: Text(
//                                   'Referrals & Bonus',
//                                   style: TextStyle(
//                                     fontSize: _drawerFontSize,
//                                     color:
//                                         Theme.of(context).colorScheme.secondary,
//                                   ),
//                                 ),
//                                 onTap: () {
//                                   // Navegar a la página de recuperación de contraseña (forgot password page)
//                                 },
//                               ),
//                               ListTile(
//                                 leading: Icon(
//                                   Icons.tune,
//                                   size: _drawerIconSize,
//                                   color:
//                                       Theme.of(context).colorScheme.secondary,
//                                 ),
//                                 title: Text(
//                                   'Perameters',
//                                   style: TextStyle(
//                                     fontSize: _drawerFontSize,
//                                     color:
//                                         Theme.of(context).colorScheme.secondary,
//                                   ),
//                                 ),
//                                 onTap: () {
//                                   // Navegar a la página de verificación (verification page)
//                                 },
//                               ),
//                               ListTile(
//                                 leading: Icon(
//                                   Icons.layers_outlined,
//                                   size: _drawerIconSize,
//                                   color:
//                                       Theme.of(context).colorScheme.secondary,
//                                 ),
//                                 title: Text(
//                                   'Services',
//                                   style: TextStyle(
//                                     fontSize: _drawerFontSize,
//                                     color:
//                                         Theme.of(context).colorScheme.secondary,
//                                   ),
//                                 ),
//                                 onTap: () {
//                                   // Navegar a la página de verificación (verification page)
//                                 },
//                               ),
//                               ListTile(
//                                 leading: Icon(
//                                   Icons.group,
//                                   size: _drawerIconSize,
//                                   color:
//                                       Theme.of(context).colorScheme.secondary,
//                                 ),
//                                 title: Text(
//                                   'Teams',
//                                   style: TextStyle(
//                                     fontSize: _drawerFontSize,
//                                     color:
//                                         Theme.of(context).colorScheme.secondary,
//                                   ),
//                                 ),
//                                 onTap: () {
//                                   // Navegar a la página de verificación (verification page)
//                                 },
//                               ),
//                               ListTile(
//                                 leading: Icon(
//                                   Icons.recycling_outlined,
//                                   size: _drawerIconSize,
//                                   color:
//                                       Theme.of(context).colorScheme.secondary,
//                                 ),
//                                 title: Text(
//                                   'Recurrences',
//                                   style: TextStyle(
//                                     fontSize: _drawerFontSize,
//                                     color:
//                                         Theme.of(context).colorScheme.secondary,
//                                   ),
//                                 ),
//                                 onTap: () {
//                                   // Navegar a la página de verificación (verification page)
//                                 },
//                               ),
//                               ListTile(
//                                 leading: Icon(
//                                   Icons.record_voice_over,
//                                   size: _drawerIconSize,
//                                   color:
//                                       Theme.of(context).colorScheme.secondary,
//                                 ),
//                                 title: Text(
//                                   'Promotions',
//                                   style: TextStyle(
//                                     fontSize: _drawerFontSize,
//                                     color:
//                                         Theme.of(context).colorScheme.secondary,
//                                   ),
//                                 ),
//                                 onTap: () {
//                                   // Navegar a la página de verificación (verification page)
//                                 },
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Divider(
//                     color: Theme.of(context).primaryColor,
//                     height: 1,
//                   ),
//                   ListTile(
//                     leading: Icon(
//                       Icons.logout_rounded,
//                       size: _drawerIconSize,
//                       color: Theme.of(context).colorScheme.secondary,
//                     ),
//                     title: Text(
//                       'Logout',
//                       style: TextStyle(
//                         fontSize: _drawerFontSize,
//                         color: Theme.of(context).colorScheme.secondary,
//                       ),
//                     ),
//                     onTap: () {
//                       // Perform logout action
//                     },
//                   ),
//                 ],
//               ),
//             ),
//             body: SingleChildScrollView(
//               child: Stack(
//                 children: [
//                   const SizedBox(
//                     height: 100,
//                     child: HeaderWidget(
//                         100, false, Icons.house_rounded, 'Profile'),
//                   ),
//                   Container(
//                     alignment: Alignment.center,
//                     margin: const EdgeInsets.fromLTRB(25, 10, 25, 10),
//                     padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
//                     child: Column(
//                       children: [
//                         Container(
//                           padding: const EdgeInsets.all(10),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(100),
//                             border: Border.all(width: 5, color: Colors.white),
//                             color: Colors.white,
//                             boxShadow: const [
//                               BoxShadow(
//                                 color: Colors.black12,
//                                 blurRadius: 20,
//                                 offset: Offset(5, 5),
//                               ),
//                             ],
//                           ),
//                           child: Icon(
//                             Icons.person,
//                             size: 80,
//                             color: Colors.grey.shade300,
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         const Text(
//                           'Mr. Donald Trump',
//                           style: TextStyle(
//                               fontSize: 22, fontWeight: FontWeight.bold),
//                         ),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         const Text(
//                           'Former President',
//                           style: TextStyle(
//                               fontSize: 16, fontWeight: FontWeight.bold),
//                         ),
//                         const SizedBox(
//                           height: 10,
//                         ),
//                         Container(
//                           padding: const EdgeInsets.all(10),
//                           child: Column(
//                             children: <Widget>[
//                               Container(
//                                 padding: const EdgeInsets.only(
//                                     left: 8.0, bottom: 4.0),
//                                 alignment: Alignment.topLeft,
//                                 child: const Text(
//                                   "User Information",
//                                   style: TextStyle(
//                                     color: Colors.black87,
//                                     fontWeight: FontWeight.w500,
//                                     fontSize: 16,
//                                   ),
//                                   textAlign: TextAlign.left,
//                                 ),
//                               ),
//                               Card(
//                                 child: Container(
//                                   alignment: Alignment.topLeft,
//                                   padding: const EdgeInsets.all(15),
//                                   child: Column(
//                                     children: <Widget>[
//                                       Column(
//                                         children: <Widget>[
//                                           ...ListTile.divideTiles(
//                                             color: Colors.grey,
//                                             tiles: [
//                                               const ListTile(
//                                                 contentPadding:
//                                                     EdgeInsets.symmetric(
//                                                         horizontal: 12,
//                                                         vertical: 4),
//                                                 leading:
//                                                     Icon(Icons.my_location),
//                                                 title: Text("Location"),
//                                                 subtitle: Text("USA"),
//                                               ),
//                                               const ListTile(
//                                                 leading: Icon(Icons.email),
//                                                 title: Text("Email"),
//                                                 subtitle: Text(
//                                                     "donaldtrump@gmail.com"),
//                                               ),
//                                               const ListTile(
//                                                 leading: Icon(Icons.phone),
//                                                 title: Text("Phone"),
//                                                 subtitle: Text("99--99876-56"),
//                                               ),
//                                               const ListTile(
//                                                 leading: Icon(Icons.person),
//                                                 title: Text("About Me"),
//                                                 subtitle: Text(
//                                                     "This is a about me link and you can khow about me in this section."),
//                                               ),
//                                             ],
//                                           ),
//                                         ],
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                               )
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class MyProfileListView extends StatelessWidget {
//   const MyProfileListView({
//     Key? key,
//     required double drawerIconSize,
//     required double drawerFontSize,
//   })  : _drawerIconSize = drawerIconSize,
//         _drawerFontSize = drawerFontSize,
//         super(key: key);

//   final double _drawerIconSize;
//   final double _drawerFontSize;

//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       padding: EdgeInsets.zero,
//       children: [
//         ListTile(
//           leading: Icon(
//             Icons.library_books,
//             size: _drawerIconSize,
//             color: Theme.of(context).colorScheme.secondary,
//           ),
//           title: Text(
//             'My Reservation',
//             style: TextStyle(
//               fontSize: 17,
//               color: Theme.of(context).colorScheme.secondary,
//             ),
//           ),
//           onTap: () {
//             // Navegar a la pantalla de inicio (splash screen)
//           },
//         ),
//         ListTile(
//           leading: Icon(
//             Icons.place_outlined,
//             size: _drawerIconSize,
//             color: Theme.of(context).colorScheme.secondary,
//           ),
//           title: Text(
//             'My Addresses',
//             style: TextStyle(
//               fontSize: _drawerFontSize,
//               color: Theme.of(context).colorScheme.secondary,
//             ),
//           ),
//           onTap: () {
//             // Navegar a la página de inicio de sesión (login page)
//           },
//         ),
//         ListTile(
//           leading: Icon(
//             Icons.account_balance_wallet_outlined,
//             size: _drawerIconSize,
//             color: Theme.of(context).colorScheme.secondary,
//           ),
//           title: Text(
//             'My Wallet',
//             style: TextStyle(
//               fontSize: _drawerFontSize,
//               color: Theme.of(context).colorScheme.secondary,
//             ),
//           ),
//           onTap: () {
//             // Navegar a la página de registro (registration page)
//           },
//         ),
//         ListTile(
//           leading: Icon(
//             Icons.person_add_alt_1_outlined,
//             size: _drawerIconSize,
//             color: Theme.of(context).colorScheme.secondary,
//           ),
//           title: Text(
//             'My Referrals',
//             style: TextStyle(
//               fontSize: _drawerFontSize,
//               color: Theme.of(context).colorScheme.secondary,
//             ),
//           ),
//           onTap: () {
//             // Navegar a la página de recuperación de contraseña (forgot password page)
//           },
//         ),
//         ListTile(
//           leading: Icon(
//             Icons.person_outline,
//             size: _drawerIconSize,
//             color: Theme.of(context).colorScheme.secondary,
//           ),
//           title: Text(
//             'Personal Information',
//             style: TextStyle(
//               fontSize: _drawerFontSize,
//               color: Theme.of(context).colorScheme.secondary,
//             ),
//           ),
//           onTap: () {
//             // Navegar a la página de verificación (verification page)
//           },
//         ),
//         ListTile(
//           leading: Icon(
//             Icons.key_outlined,
//             size: _drawerIconSize,
//             color: Theme.of(context).colorScheme.secondary,
//           ),
//           title: Text(
//             'Change Password',
//             style: TextStyle(
//               fontSize: _drawerFontSize,
//               color: Theme.of(context).colorScheme.secondary,
//             ),
//           ),
//           onTap: () {
//             // Navegar a la página de verificación (verification page)
//           },
//         ),
//       ],
//     );
//   }
// }
