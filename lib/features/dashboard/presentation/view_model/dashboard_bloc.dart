import 'package:demo_test/features/dashboard/domain/use_case/get_schedules_usecase.dart';
import 'package:demo_test/features/dashboard/presentation/view_model/dashboard_event.dart';
import 'package:demo_test/features/dashboard/presentation/view_model/dashboard_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final GetSchedulesUseCase getSchedulesUseCase;

  DashboardBloc({required this.getSchedulesUseCase})
      : super(DashboardInitial()) {
    on<SearchSchedulesEvent>(_onSearchSchedules);
  }

  Future<void> _onSearchSchedules(
    SearchSchedulesEvent event,
    Emitter<DashboardState> emit,
  ) async {
    emit(DashboardLoading());

    final result = await getSchedulesUseCase.execute(
      source: event.source,
      destination: event.destination,
      date: event.date,
    );

    emit(result.fold(
      (failure) => DashboardError('Failed to load schedules'),
      (schedules) => DashboardLoaded(schedules: schedules),
    ));
  }
}
