import 'package:demo_test/features/dashboard/domain/entity/popular_route.dart';

class PopularRouteModel extends PopularRoute {
  PopularRouteModel({
    required String source,
    required String destination,
    required int frequency,
    required String imageUrl,
  }) : super(
          source: source,
          destination: destination,
          frequency: frequency,
          imageUrl: imageUrl,
        );

  factory PopularRouteModel.fromJson(Map<String, dynamic> json) {
    return PopularRouteModel(
      source: json['source'],
      destination: json['destination'],
      frequency: json['frequency'],
      imageUrl: json['imageUrl'],
    );
  }
}