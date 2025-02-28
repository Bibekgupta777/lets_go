import 'package:demo_test/app/shared_prefs/token_shared_prefs.dart';
import 'package:demo_test/core/network/api_service.dart';
import 'package:demo_test/core/network/hive_service.dart';
import 'package:demo_test/features/auth/data/data_source/local_datasource/local_datasource.dart';
import 'package:demo_test/features/auth/data/data_source/remote_datasource/remote_datasource.dart';
import 'package:demo_test/features/auth/data/repositories/user_local_repository.dart';
import 'package:demo_test/features/auth/data/repositories/user_remote_repository.dart';
import 'package:demo_test/features/auth/domain/use_case/create_user_usecase.dart';
import 'package:demo_test/features/auth/domain/use_case/login_usecase.dart';
import 'package:demo_test/features/auth/domain/use_case/upload_image_usecase.dart';
import 'package:demo_test/features/auth/presentation/view_model/login/login_bloc.dart';
import 'package:demo_test/features/auth/presentation/view_model/signup/register_bloc.dart';
import 'package:demo_test/features/dashboard/data/data_source/dashboard_remote_data_source.dart';
import 'package:demo_test/features/dashboard/data/repositories/dashboard_repository_impl.dart';
import 'package:demo_test/features/dashboard/domain/repository/dashboard_repository.dart';
import 'package:demo_test/features/dashboard/domain/use_case/get_schedules_usecase.dart';
import 'package:demo_test/features/dashboard/presentation/view_model/dashboard_bloc.dart';
import 'package:demo_test/features/home/presentation/view_model/home_cubit.dart';
import 'package:demo_test/features/onBoarding/presentation/view_model/onboarding_cubit.dart';
import 'package:demo_test/features/splash/presentation/view_model/splash_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> initDependencies() async {
  await _initHiveService();
  await _initApiService();
  await _initSharedPreferences();

  await _initHomeDependencies();
  await _initRegisterDependencies();
  await _initLoginDependencies();
  await _initDashboardDependencies();

  await _initOnBoardingScreenDependencies();
  await _initSplashScreenDependencies();
}

Future<void> _initSharedPreferences() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
}

_initHiveService() async {
  getIt.registerLazySingleton<HiveService>(() => HiveService());
}

_initApiService() {
  // Remote Data Source
  getIt.registerLazySingleton<Dio>(
    () => ApiService(Dio()).dio,
  );
}

_initRegisterDependencies() async {
  // Local Data Source
  getIt
      .registerFactory<UserLocalDataSource>(() => UserLocalDataSource(getIt()));

  // Remote Data Source
  getIt.registerFactory<UserRemoteDataSource>(
      () => UserRemoteDataSource(getIt<Dio>()));

  // Local Repository
  getIt.registerLazySingleton<UserLocalRepository>(() =>
      UserLocalRepository(userLocalDataSource: getIt<UserLocalDataSource>()));

  // Remote Repository
  getIt.registerLazySingleton<UserRemoteRepository>(
      () => UserRemoteRepository(getIt<UserRemoteDataSource>()));

  // Usecases
  getIt.registerLazySingleton<CreateUserUsecase>(
    () => CreateUserUsecase(userRepository: getIt<UserRemoteRepository>()),
  );

  getIt.registerLazySingleton<UploadImageUsecase>(
    () => UploadImageUsecase(
      getIt<UserRemoteRepository>(),
    ),
  );

  getIt.registerFactory<RegisterBloc>(
    () => RegisterBloc(
      createUserUsecase: getIt<CreateUserUsecase>(),
      uploadImageUsecase: getIt<UploadImageUsecase>(),
    ),
  );
}

_initOnBoardingScreenDependencies() async {
  getIt.registerFactory(
    () => OnboardingCubit(getIt<LoginBloc>()),
  );
}

_initHomeDependencies() async {
  getIt.registerFactory<HomeCubit>(
    () => HomeCubit(),
  );
}

_initLoginDependencies() async {
  // =========================== Token Shared Preferences ===========================
  getIt.registerLazySingleton<TokenSharedPrefs>(
    () => TokenSharedPrefs(getIt<SharedPreferences>()),
  );

  getIt.registerLazySingleton<LoginUsecase>(
    () => LoginUsecase(
      getIt<UserRemoteRepository>(),
      getIt<TokenSharedPrefs>(),
    ),
  );

  getIt.registerFactory<LoginBloc>(
    () => LoginBloc(
      registerBloc: getIt<RegisterBloc>(),
      homeCubit: getIt<HomeCubit>(),
      loginUsecase: getIt<LoginUsecase>(),
    ),
  );
}

_initSplashScreenDependencies() async {
  getIt.registerFactory(
    () => SplashCubit(getIt<OnboardingCubit>()),
  );
}

Future<void> _initDashboardDependencies() async {
  // Remote Data Source
  getIt.registerLazySingleton<DashboardRemoteDataSource>(
    () => DashboardRemoteDataSourceImpl(getIt<Dio>()),
  );

  // Repository
  getIt.registerLazySingleton<DashboardRepository>(
    () => DashboardRepositoryImpl(
      remoteDataSource: getIt<DashboardRemoteDataSource>(),
    ),
  );

  // Use Case
  getIt.registerLazySingleton<GetSchedulesUseCase>(
    () => GetSchedulesUseCase(getIt<DashboardRepository>()),
  );

  // Bloc
  getIt.registerFactory<DashboardBloc>(
    () => DashboardBloc(
      getSchedulesUseCase: getIt<GetSchedulesUseCase>(),
    ),
  );
}
