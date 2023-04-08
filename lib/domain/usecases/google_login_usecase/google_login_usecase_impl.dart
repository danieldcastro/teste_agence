// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:teste_agence/domain/contracts/repositories/google_login_repository.dart';

import '../../../infrastructure/errors/auth_exception.dart';
import 'google_login_usecase.dart';

class GoogleLoginUsecaseImpl implements GoogleLoginUsecase {
  final GoogleLoginRepository _repository;

  GoogleLoginUsecaseImpl({
    required GoogleLoginRepository repository,
  }) : _repository = repository;

  @override
  Future<Either<AuthException, UserCredential>> signIn() async {
    final result = await _repository.signIn();

    if (result.isLeft) {
      return Left(result.left);
    }

    return Right(result.right);
  }

  @override
  Future<Either<AuthException, void>> signOut() async {
    final result = await _repository.signOut();
    if (result.isLeft) {
      return Left(result.left);
    }
    return Right(result.right);
  }
}
