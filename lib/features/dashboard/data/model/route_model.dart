import 'package:demo_test/features/dashboard/domain/entity/route.dart';

class RouteModel extends Routee {
  const RouteModel({
    required super.id,
    required super.source,
    required super.destination,
    required super.distance,
    required super.duration,
  });

  factory RouteModel.fromJson(Map<String, dynamic> json) {
    return RouteModel(
      id: json['_id'],
      source: json['source'],
      destination: json['destination'],
      distance: json['distance'].toDouble(),
      duration: json['duration'],
    );
  }
}
