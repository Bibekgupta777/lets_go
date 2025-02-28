import 'package:demo_test/features/dashboard/domain/entity/bus.dart';
import 'package:demo_test/features/dashboard/domain/entity/route.dart';
import 'package:equatable/equatable.dart';

class Schedule extends Equatable {
  final String id;
  final Bus bus;
  final Routee route;
  final DateTime departureTime;
  final DateTime arrivalTime;
  final double fare;
  final int availableSeats;

  const Schedule({
    required this.id,
    required this.bus,
    required this.route,
    required this.departureTime,
    required this.arrivalTime,
    required this.fare,
    required this.availableSeats,
  });

  @override
  List<Object?> get props => [
        id,
        bus,
        route,
        departureTime,
        arrivalTime,
        fare,
        availableSeats,
      ];
}
