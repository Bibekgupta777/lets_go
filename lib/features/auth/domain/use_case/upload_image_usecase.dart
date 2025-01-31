import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:demo_test/app/usecase/usecase.dart';
import 'package:demo_test/core/error/failure.dart';
import 'package:demo_test/features/auth/domain/repository/user_repository.dart';


class UploadImageParams {
  final File file;

  const UploadImageParams({
    required this.file,
  });
}

class UploadImageUsecase
    implements UsecaseWithParams<String, UploadImageParams> {
  final IUserRepository _repository;

  UploadImageUsecase(this._repository);

  @override
  Future<Either<Failure, String>> call(UploadImageParams params) {
    return _repository.uploadProfilePicture(params.file);
  }
}