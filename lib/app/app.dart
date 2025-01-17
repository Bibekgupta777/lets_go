import 'package:demo_test/app/di/di.dart';
import 'package:demo_test/core/theme/app_theme.dart';
import 'package:demo_test/features/auth/presentation/view_model/login/login_bloc.dart';
import 'package:demo_test/features/auth/presentation/view_model/signup/register_bloc.dart';
import 'package:demo_test/features/home/presentation/view_model/home_cubit.dart';
import 'package:demo_test/features/splash/presentation/view/splash_view.dart';
import 'package:demo_test/features/splash/presentation/view_model/splash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SplashCubit>(
          create: (_) => getIt<SplashCubit>(),
        ),
        BlocProvider<HomeCubit>(
          create: (_) => getIt<HomeCubit>(),
        ),
        BlocProvider<RegisterBloc>(
          create: (_) => getIt<RegisterBloc>(),
        ),
        BlocProvider<LoginBloc>(
          create: (_) => getIt<LoginBloc>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Revive Reads',
        theme: getApplicationTheme(),
        home: const SplashView(),
      ),
    );
  }
}
