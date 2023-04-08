// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../infrastructure/errors/auth_exception.dart';
import '../../contracts/repositories/facebook_login_repository.dart';
import 'facebook_login_usecase.dart';

class FacebookLoginUsecaseImpl implements FacebookLoginUsecase {
  final FacebookLoginRepository _repository;

  FacebookLoginUsecaseImpl({
    required FacebookLoginRepository repository,
  }) : _repository = repository;

  @override
  Future<Either<AuthException, User>> signIn() async {
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

  @override
  bool isFacebookLoggedIn() {
    final result = _repository.isFacebookLoggedIn();

    return result;
  }
}
