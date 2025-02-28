import 'package:demo_test/features/dashboard/domain/entity/bus.dart';

class BusModel extends Bus {
  const BusModel({
    required super.id,
    required super.busNumber,
    required super.totalSeats,
  });

  factory BusModel.fromJson(Map<String, dynamic> json) {
    return BusModel(
      id: json['_id'],
      busNumber: json['bus_number'],
      totalSeats: json['total_seats'],
    );
  }
}
