import 'package:demo_test/core/network/hive_service.dart';
import 'package:demo_test/features/auth/data/data_source/local_datasource/local_datasource.dart';
import 'package:demo_test/features/auth/data/repositories/user_local_repository.dart';
import 'package:demo_test/features/auth/domain/use_case/create_user_usecase.dart';
import 'package:demo_test/features/auth/domain/use_case/login_usecase.dart';
import 'package:demo_test/features/auth/presentation/view_model/login/login_bloc.dart';
import 'package:demo_test/features/auth/presentation/view_model/signup/register_bloc.dart';
import 'package:demo_test/features/home/presentation/view_model/home_cubit.dart';

import 'package:demo_test/features/onBoarding/presentation/view_model/onboarding_cubit.dart';
import 'package:demo_test/features/splash/presentation/view_model/splash_cubit.dart';
import 'package:get_it/get_it.dart';


final getIt = GetIt.instance;

Future<void> initDependencies() async {
  await _initHiveService();

  await _initHomeDependencies();
  await _initRegisterDependencies();
  await _initLoginDependencies();

  await _initOnBoardingScreenDependencies();
  await _initSplashScreenDependencies();
}

_initHiveService() async {
  getIt.registerLazySingleton<HiveService>(() => HiveService());
}

_initRegisterDependencies() async {
  // Data Source
  getIt
      .registerFactory<UserLocalDataSource>(() => UserLocalDataSource(getIt()));

  // Repository
  getIt.registerLazySingleton<UserLocalRepository>(() =>
      UserLocalRepository(userLocalDataSource: getIt<UserLocalDataSource>()));

  // Usecases
  getIt.registerLazySingleton<CreateUserUsecase>(
    () => CreateUserUsecase(userRepository: getIt<UserLocalRepository>()),
  );

  getIt.registerFactory<RegisterBloc>(
    () => RegisterBloc(
      createUserUsecase: getIt<CreateUserUsecase>(),
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
  getIt.registerLazySingleton<LoginUsecase>(
    () => LoginUsecase(
      getIt<UserLocalRepository>(),
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