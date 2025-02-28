import 'package:demo_test/core/error/failure.dart';
import 'package:demo_test/features/dashboard/data/model/route_model.dart';
import 'package:demo_test/features/dashboard/data/model/schedule_model.dart';
import 'package:demo_test/features/dashboard/domain/entity/route.dart';
import 'package:demo_test/features/dashboard/domain/entity/schedule.dart';
import 'package:dio/dio.dart';

abstract class DashboardRemoteDataSource {
  Future<List<Schedule>> getSchedules({
    required String source,
    required String destination,
    required DateTime date,
  });
  Future<List<Routee>> getAllRoutes();
}

class DashboardRemoteDataSourceImpl implements DashboardRemoteDataSource {
  final Dio dio;

  DashboardRemoteDataSourceImpl(this.dio);

  @override
  Future<List<Schedule>> getSchedules({
    required String source,
    required String destination,
    required DateTime date,
  }) async {
    try {
      final response = await dio.get(
        '/api/schedule/search',
        queryParameters: {
          'source': source,
          'destination': destination,
          'date': date.toIso8601String(),
        },
      );

      if (response.statusCode == 200) {
        final schedules = (response.data['schedules'] as List)
            .map((x) => ScheduleModel.fromJson(x))
            .toList();
        return schedules;
      } else {
        throw Exception();
      }
    } catch (e) {
      throw ApiFailure(message: e.toString());
    }
  }

  @override
  Future<List<Routee>> getAllRoutes() async {
    try {
      final response = await dio.get('/api/route/all');

      if (response.statusCode == 200) {
        final routes = (response.data['data'] as List)
            .map((x) => RouteModel.fromJson(x))
            .toList();
        return routes;
      } else {
        throw Exception();
      }
    } catch (e) {
      throw ApiFailure(message: e.toString());
    }
  }
}
