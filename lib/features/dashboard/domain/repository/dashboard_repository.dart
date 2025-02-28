import 'package:dartz/dartz.dart';
import 'package:demo_test/core/error/failure.dart';
import 'package:demo_test/features/dashboard/domain/entity/route.dart';
import 'package:demo_test/features/dashboard/domain/entity/schedule.dart';

abstract class DashboardRepository {
  Future<Either<Failure, List<Schedule>>> getSchedules({
    required String source,
    required String destination,
    required DateTime date,
  });
  Future<Either<Failure, List<Routee>>> getAllRoutes();
}
