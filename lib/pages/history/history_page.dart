// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:graphql_flutter/graphql_flutter.dart';
// import 'package:cleanserv/pages/dashboard/dashboard_controller.dart';
// import 'package:cleanserv/graphql_strings.dart' as gql_str;

// class HistoryPage extends GetWidget<DashboardController> {
//   const HistoryPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // final Link link = controller.authLink.concat(httpLink);
//     final ValueNotifier<GraphQLClient> client = ValueNotifier(
//       GraphQLClient(
//         cache: GraphQLCache(),
//         link: controller.link,
//       ),
//     );
//     return GraphQLProvider(
//         client: client,
//         child: Scaffold(
//           appBar: AppBar(
//             title: const Text('Reservations History'),
//           ),
//           body: Query(
//             options: QueryOptions(
//               document: gql(gql_str.getReservations),
//             ),
//             builder: (QueryResult<Object?> result,
//                 {VoidCallback? refetch, FetchMore? fetchMore}) {
//               if (result.hasException) {
//                 // print(result.exception);
//                 return const Center(
//                   child: Text('Error loading service types.'),
//                 );
//               }

//               if (result.isLoading) {
//                 return const Center(
//                   child: CircularProgressIndicator(),
//                 );
//               }

//               if (result.data != null) {
//                 // print(result.data);
//                 List<dynamic> nodes = result.data?['services']?['nodes'] ?? [];
//                 // print("Lenght: " + nodes.length.toString());
//                 // print("Rating: " + nodes[1]['rating'].toString());
//                 return ListView.builder(
//                   itemCount: nodes.length,
//                   itemBuilder: (context, index) {
//                     final service = nodes[index];
//                     // return Card(
//                     //   child: ListTile(
//                     //     title: Text(serviceType['servicetype']),
//                     //     subtitle: Text(serviceType['description']),
//                     //   ),
//                     // );
//                     Color getColorFromStatus(int status) {
//                       switch (status) {
//                         case 1:
//                           return Colors.yellow;
//                         case 2:
//                           return Colors.green;
//                         case 3:
//                           return Colors.green;
//                         case 4:
//                           return Colors.red;
//                         default:
//                           return Colors.grey;
//                       }
//                     }

//                     String getStatusText(int status) {
//                       switch (status) {
//                         case 1:
//                           return 'reserved';
//                         case 2:
//                           return 'paid';
//                         case 3:
//                           return 'done';
//                         case 4:
//                           return 'canceled';
//                         default:
//                           return '';
//                       }
//                     }

//                     int status = service['status'];
//                     bool showAdditionalTexts = status == 3;

//                     return Padding(
//                       padding: const EdgeInsets.all(5.0),
//                       child: Card(
//                         elevation: 8.0,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(20.0),
//                         ),
//                         child: Column(
//                           children: [
//                             ListTile(
//                               title: Text(
//                                 service!['servicetype']?['servicetype'] ?? "",
//                                 style: const TextStyle(
//                                   color: Color(0xFF1C1C1C),
//                                   fontSize: 24,
//                                   fontFamily: 'Roboto',
//                                   fontWeight: FontWeight.w600,
//                                   height: 0.04,
//                                   letterSpacing: -0.84,
//                                 ),
//                               ),
//                               subtitle: const Text("Clean Services"),
//                               trailing: Row(
//                                 mainAxisSize: MainAxisSize.min,
//                                 children: List.generate(
//                                   service['rating'] ?? 0,
//                                   (index) => const ColorFiltered(
//                                     colorFilter: ColorFilter.mode(
//                                         Colors.yellow, BlendMode.srcIn),
//                                     child: Icon(Icons.star),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             //  SizedBox(
//                             //    height: 200.0,
//                             //    child: Ink.image(
//                             //      image: cardImage,
//                             //      fit: BoxFit.cover,
//                             //    ),
//                             //  ),
//                             Padding(
//                               padding: const EdgeInsets.all(16.0),
//                               child: Align(
//                                 alignment: Alignment.centerLeft,
//                                 child: Text(
//                                   "\$${service['totalprice'].toStringAsFixed(2)}",
//                                   style: const TextStyle(
//                                     fontSize: 32,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.black,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             // Expanded(
//                             //   child: Container(
//                             //     color: Colors.grey[200],
//                             //     child: Align(
//                             //       alignment: Alignment.center,
//                             //       child: Text(
//                             //         "\$${service['totalprice']}",
//                             //         style: const TextStyle(
//                             //           fontSize: 32,
//                             //           fontWeight: FontWeight.bold,
//                             //           color: Colors.black,
//                             //         ),
//                             //       ),
//                             //     ),
//                             //   ),
//                             // ),
//                             // ButtonBar(
//                             //   children: [
//                             //     // TextButton(
//                             //     //   child: const Text('RESERVE NOW'),
//                             //     //   onPressed: () {/* ... */},
//                             //     // ),
//                             //     // TextButton(
//                             //     //   child: const Text('LEARN MORE'),
//                             //     //   onPressed: () {/* ... */},
//                             //     // )
//                             //     if (showAdditionalTexts) ...[
//                             //       SizedBox(height: 8.0),
//                             //       Text(
//                             //         'Ver factura',
//                             //         style: TextStyle(
//                             //           fontSize: 12.0,
//                             //           fontWeight: FontWeight.normal,
//                             //         ),
//                             //       ),
//                             //       SizedBox(height: 8.0),
//                             //       Text(
//                             //         'Pagar factura',
//                             //         style: TextStyle(
//                             //           fontSize: 12.0,
//                             //           fontWeight: FontWeight.normal,
//                             //         ),
//                             //       ),
//                             //     ],
//                             //     ElevatedButton(
//                             //       style: ElevatedButton.styleFrom(
//                             //         shape: RoundedRectangleBorder(
//                             //           borderRadius: BorderRadius.circular(20.0),
//                             //         ),
//                             //         backgroundColor:
//                             //             getColorFromStatus(service['status']),
//                             //       ),
//                             //       onPressed: () {/* ... */},
//                             //       child: Text(
//                             //         getStatusText(service['status']),
//                             //         style: const TextStyle(
//                             //           fontSize: 16.0,
//                             //           fontWeight: FontWeight.bold,
//                             //         ),
//                             //       ),
//                             //     ),
//                             //   ],
//                             // )
//                             ButtonBar(
//                               children: [
//                                 if (showAdditionalTexts) ...[
//                                   ElevatedButton(
//                                     style: ElevatedButton.styleFrom(
//                                       shape: RoundedRectangleBorder(
//                                         borderRadius:
//                                             BorderRadius.circular(20.0),
//                                       ),
//                                       backgroundColor: Colors
//                                           .blue, // Color predeterminado para los botones
//                                     ),
//                                     onPressed: () {
//                                       // Acción del botón "Ver factura"
//                                     },
//                                     child: const Text(
//                                       'Ver factura',
//                                       style: TextStyle(
//                                         fontSize: 12.0,
//                                         fontWeight: FontWeight.normal,
//                                       ),
//                                     ),
//                                   ),
//                                   ElevatedButton(
//                                     style: ElevatedButton.styleFrom(
//                                       shape: RoundedRectangleBorder(
//                                         borderRadius:
//                                             BorderRadius.circular(20.0),
//                                       ),
//                                       backgroundColor: Colors
//                                           .blue, // Color predeterminado para los botones
//                                     ),
//                                     onPressed: () {
//                                       // Acción del botón "Pagar factura"
//                                     },
//                                     child: const Text(
//                                       'Pagar factura',
//                                       style: TextStyle(
//                                         fontSize: 12.0,
//                                         fontWeight: FontWeight.normal,
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                                 ElevatedButton(
//                                   style: ElevatedButton.styleFrom(
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(20.0),
//                                     ),
//                                     backgroundColor:
//                                         getColorFromStatus(service['status']),
//                                   ),
//                                   onPressed: () {
//                                     // Acción del botón "done"
//                                   },
//                                   child: Text(
//                                     getStatusText(service['status']),
//                                     style: const TextStyle(
//                                       fontSize: 16.0,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 );

//                 // return GridView.count(
//                 //   crossAxisCount: 2,
//                 //   children: List.generate(nodes.length, (index) {
//                 //     final serviceType = nodes[index];
//                 //     return Padding(
//                 //       padding: const EdgeInsets.all(10.0),
//                 //       child: Card(
//                 //         elevation: 8.0,
//                 //         shape: RoundedRectangleBorder(
//                 //           borderRadius: BorderRadius.circular(20.0),
//                 //         ),
//                 //         child: Column(
//                 //           crossAxisAlignment: CrossAxisAlignment.start,
//                 //           children: [
//                 //             Expanded(
//                 //               child: ListTile(
//                 //                 title: Text(
//                 //                   serviceType['servicetype'],
//                 //                   style: const TextStyle(
//                 //                     color: Color(0xFF1C1C1C),
//                 //                     fontSize: 24,
//                 //                     fontFamily: 'Roboto',
//                 //                     fontWeight: FontWeight.w600,
//                 //                     height: 0.04,
//                 //                     letterSpacing: -0.84,
//                 //                   ),
//                 //                 ),
//                 //                 subtitle: const Text("Clean Services"),
//                 //                 // trailing: const Icon(Icons.favorite_outline),
//                 //               ),
//                 //             ),
//                 //             Align(
//                 //               alignment: Alignment.bottomLeft,
//                 //               child: Padding(
//                 //                 padding: const EdgeInsets.only(
//                 //                     left: 10.0, bottom: 10.0),
//                 //                 child: TextButton(
//                 //                   child: const Text('Learn More'),
//                 //                   onPressed: () {/* ... */},
//                 //                 ),
//                 //               ),
//                 //             ),
//                 //           ],
//                 //         ),
//                 //       ),
//                 //     );
//                 //   }),
//                 // ); // Add a default return statement
//               } else {
//                 return const Center(
//                   child: Text('Error loading service types.'),
//                 );
//               }
//               // print("Srvicios " + serviceTypes);
//             },
//           ),
//         ));
//   }
// }

// // import 'dart:ui';

// // import 'package:cleanserv/widgets/image_header_widget.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter/src/widgets/framework.dart';
// // import 'package:flutter/src/widgets/placeholder.dart';

// // class HistoryPage extends StatelessWidget {
// //   const HistoryPage({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Stack(
// //         children: [
// //           Positioned.fill(
// //             child: ColorFiltered(
// //               colorFilter: ColorFilter.mode(
// //                 Colors.white.withOpacity(
// //                     0.7), // Ajusta la opacidad según tus necesidades
// //                 BlendMode.srcATop,
// //               ),
// //               child: const ImageHeader(),
// //             ),
// //           ),
// //           BackdropFilter(
// //             filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
// //             child: Container(
// //               color: Colors.white.withOpacity(0.75),
// //             ),
// //           ),
// //           SafeArea(
// //               child: Padding(
// //                   padding: const EdgeInsets.all(15.0), child: Container())),
// //         ],
// //       ),
// //     );
// //   }
// // }
