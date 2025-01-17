import 'package:dartz/dartz.dart';
import 'package:demo_test/app/usecase/usecase.dart';
import 'package:demo_test/core/error/failure.dart';
import 'package:demo_test/features/auth/domain/entity/user_entity.dart';
import 'package:demo_test/features/auth/domain/repository/user_repository.dart';

class GetAllUserUsecase implements UsecaseWithoutParams<List<UserEntity>> {
  final IUserRepository userRepository;

  GetAllUserUsecase({required this.userRepository});

  @override
  Future<Either<Failure, List<UserEntity>>> call() {
    return userRepository.getAllUsers();
  }
}
