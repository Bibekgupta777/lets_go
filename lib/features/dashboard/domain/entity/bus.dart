import 'package:equatable/equatable.dart';

class Bus extends Equatable {
  final String id;
  final String busNumber;
  final int totalSeats;

  const Bus({
    required this.id,
    required this.busNumber,
    required this.totalSeats,
  });

  @override
  List<Object?> get props => [id, busNumber, totalSeats];
}