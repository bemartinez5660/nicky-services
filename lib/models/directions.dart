// import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

///
/// Modelo de datos para las rutas sus coordenadas y datos asociados en los
/// Mapas de Google
///
class Directions {
  final LatLngBounds bounds;
  //final List<PointLatLng> polylinePoints;
  final String totalDistance;
  final String totalDuration;

  Directions({
    required this.bounds,
    //required this.polylinePoints,
    required this.totalDistance,
    required this.totalDuration,
  });

  static Directions? fromJson(Map<String, dynamic> json) {
    if ((json['routes'] as List).isEmpty) {
      // Si no está habilitada la ruta
      return null;
    } else {
      // Sino, obtener los datos de la ruta
      final data = Map<String, dynamic>.from(json['routes'][0]);
      // Obtener los Bounds
      final northeast = data['bounds']['northeast'];
      final southwest = data['bounds']['southwest'];
      final bounds = LatLngBounds(
        northeast: LatLng(northeast['lat'], northeast['lng']),
        southwest: LatLng(southwest['lat'], southwest['lng']),
      );
      // Obtener las distancia y la duración
      String distance = '';
      String duration = '';
      if ((data['legs'] as List).isNotEmpty) {
        final legs = data['legs'][0];
        distance = legs['distance']['text'];
        duration = legs['duration']['text'];
      }
      // ...
      return Directions(
        bounds: bounds,
        //polylinePoints: PolylinePoints()
        //.decodePolyline(data['overview_polyline']['points']),
        totalDistance: distance,
        totalDuration: duration,
      );
    }
  }
}
