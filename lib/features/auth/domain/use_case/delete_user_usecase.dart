import 'package:dartz/dartz.dart';
import 'package:demo_test/app/shared_prefs/token_shared_prefs.dart';
import 'package:demo_test/app/usecase/usecase.dart';
import 'package:demo_test/core/error/failure.dart';
import 'package:demo_test/features/auth/domain/repository/user_repository.dart';
import 'package:equatable/equatable.dart';

class DeleteUserParams extends Equatable {
  final String userId;

  const DeleteUserParams({required this.userId});

  const DeleteUserParams.empty() : userId = '_empty.string';

  @override
  List<Object?> get props => [userId];
}

class DeleteUserUsecase implements UsecaseWithParams<void, DeleteUserParams> {
  final IUserRepository userRepository;
  final TokenSharedPrefs tokenSharedPrefs;

  DeleteUserUsecase({
    required this.userRepository,
    required this.tokenSharedPrefs,
  });

  @override
  Future<Either<Failure, void>> call(DeleteUserParams params) async {
    // Get token from Shared Preferences and send it to the server
    final token = await tokenSharedPrefs.getToken();
    return token.fold((l) {
      return Left(l);
    }, (r) async {
      return await userRepository.deleteUser(params.userId);
    });
  }
}