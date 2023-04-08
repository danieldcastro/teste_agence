import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../infrastructure/errors/auth_exception.dart';

abstract class FacebookLoginRepository {
  Future<Either<AuthException, User>> signIn();
  Future<Either<AuthException, void>> signOut();
  bool isFacebookLoggedIn();
}
