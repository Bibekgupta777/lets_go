import 'package:demo_test/features/dashboard/data/model/bus_model.dart';
import 'package:demo_test/features/dashboard/data/model/route_model.dart';
import 'package:demo_test/features/dashboard/domain/entity/schedule.dart';

class ScheduleModel extends Schedule {
  const ScheduleModel({
    required super.id,
    required super.bus,
    required super.route,
    required super.departureTime,
    required super.arrivalTime,
    required super.fare,
    required super.availableSeats,
  });

  factory ScheduleModel.fromJson(Map<String, dynamic> json) {
    return ScheduleModel(
      id: json['_id'],
      bus: BusModel.fromJson(json['bus_id']),
      route: RouteModel.fromJson(json['route_id']),
      departureTime: DateTime.parse(json['departure_time']),
      arrivalTime: DateTime.parse(json['arrival_time']),
      fare: json['fare'].toDouble(),
      availableSeats: json['available_seats'],
    );
  }
}
