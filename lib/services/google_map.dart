import 'package:get/get.dart';
// import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// import 'package:supiplus/environment/environment.dart';
import 'package:cleanserv/models/directions.dart';

class GoogleMap extends GetxService {
  static GoogleMap get service => Get.find();
  Future<GoogleMap> init() async => this;

  ///
  /// Solicitud HTTP para devolver indicaciones con formato JSON o XML entre
  /// dos ubicaciones en el mapa
  ///
  Future<Directions?> getDirections({
    required LatLng origin,
    required LatLng destination,
  }) async {
    // const queryPath = 'https://maps.googleapis.com/maps/api/directions/json?';
    // final http = Dio();
    // final response = await http.get(
    //   queryPath,
    //   queryParameters: {
    //     'origin': '${origin.latitude},${origin.longitude}',
    //     'destination': '${destination.latitude},${destination.longitude}',
    //     'key': Environment.googleApiKey,
    //   },
    // );
    // if (response.statusCode == 200) {
    //   return Directions.fromJson(response.data);
    // } else {
    //   return null;
    // }
    return null;
  }
}
