import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:demo_test/app/usecase/usecase.dart';
import 'package:demo_test/core/error/failure.dart';
import 'package:demo_test/features/auth/domain/repository/user_repository.dart';

class LoginParams extends Equatable {
  final String email;
  final String password;

  const LoginParams({
    required this.email,
    required this.password,
  });

  const LoginParams.initial()
      : email = '',
        password = '';

  @override
  List<Object?> get props => [email, password];
}

class LoginUsecase implements UsecaseWithParams<String, LoginParams> {
  final IUserRepository repository;

  LoginUsecase(this.repository);

  @override
  Future<Either<Failure, String>> call(LoginParams params) {
    return repository.loginUser(params.email, params.password);
  }
}
