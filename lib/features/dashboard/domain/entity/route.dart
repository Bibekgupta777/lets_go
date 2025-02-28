import 'package:equatable/equatable.dart';

class Routee extends Equatable {
  final String id;
  final String source;
  final String destination;
  final double distance;
  final int duration;

  const Routee({
    required this.id,
    required this.source,
    required this.destination,
    required this.distance,
    required this.duration,
  });

  @override
  List<Object?> get props => [id, source, destination, distance, duration];
}
