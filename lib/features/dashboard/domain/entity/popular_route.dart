import 'package:equatable/equatable.dart';

class PopularRoute extends Equatable {
  final String source;
  final String destination;
  final int frequency;
  final String imageUrl;

  const PopularRoute({
    required this.source,
    required this.destination,
    required this.frequency,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [source, destination, frequency, imageUrl];
}