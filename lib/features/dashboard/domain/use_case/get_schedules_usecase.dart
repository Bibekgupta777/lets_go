import 'package:dartz/dartz.dart';
import 'package:demo_test/core/error/failure.dart';
import 'package:demo_test/features/dashboard/domain/entity/schedule.dart';
import 'package:demo_test/features/dashboard/domain/repository/dashboard_repository.dart';

class GetSchedulesUseCase {
  final DashboardRepository repository;

  GetSchedulesUseCase(this.repository);

  Future<Either<Failure, List<Schedule>>> execute({
    required String source,
    required String destination,
    required DateTime date,
  }) {
    return repository.getSchedules(
      source: source,
      destination: destination,
      date: date,
    );
  }
}

