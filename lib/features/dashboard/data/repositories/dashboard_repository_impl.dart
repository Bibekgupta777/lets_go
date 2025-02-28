import 'package:dartz/dartz.dart';
import 'package:demo_test/core/error/failure.dart';
import 'package:demo_test/features/dashboard/data/data_source/dashboard_remote_data_source.dart';
import 'package:demo_test/features/dashboard/domain/entity/route.dart';
import 'package:demo_test/features/dashboard/domain/entity/schedule.dart';
import 'package:demo_test/features/dashboard/domain/repository/dashboard_repository.dart';

class DashboardRepositoryImpl implements DashboardRepository {
  final DashboardRemoteDataSource remoteDataSource;

  DashboardRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, List<Schedule>>> getSchedules({
    required String source,
    required String destination,
    required DateTime date,
  }) async {
    try {
      final schedules = await remoteDataSource.getSchedules(
        source: source,
        destination: destination,
        date: date,
      );
      return Right(schedules);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Routee>>> getAllRoutes() async {
    try {
      final routes = await remoteDataSource.getAllRoutes();
      return Right(routes);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }
}
