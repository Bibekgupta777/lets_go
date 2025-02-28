import 'package:equatable/equatable.dart';

abstract class DashboardEvent extends Equatable {
  const DashboardEvent();

  @override
  List<Object> get props => [];
}

class SearchSchedulesEvent extends DashboardEvent {
  final String source;
  final String destination;
  final DateTime date;

  const SearchSchedulesEvent({
    required this.source,
    required this.destination,
    required this.date,
  });

  @override
  List<Object> get props => [source, destination, date];
}
