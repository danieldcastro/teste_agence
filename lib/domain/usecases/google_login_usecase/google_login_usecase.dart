import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../infrastructure/errors/auth_exception.dart';

abstract class GoogleLoginUsecase {
  Future<Either<AuthException, UserCredential>> signIn();
  Future<Either<AuthException, void>> signOut();
  bool isGoogleLoggedIn();
}
