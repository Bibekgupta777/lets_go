import 'package:demo_test/features/auth/presentation/view/login_screen.dart';
import 'package:demo_test/features/auth/presentation/view_model/login/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class OnboardingCubit extends Cubit<void> {
  OnboardingCubit(this._loginBloc) : super(null);

  final LoginBloc _loginBloc;

  void navigateToLogin(BuildContext context) {
    if (context.mounted) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => BlocProvider.value(
              value: _loginBloc,
              child: LoginView(),
            ),
          ));
    }
  }
}
