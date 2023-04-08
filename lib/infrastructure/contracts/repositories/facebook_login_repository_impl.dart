import 'dart:developer';

import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import '../../../domain/contracts/repositories/facebook_login_repository.dart';
import '../../errors/auth_exception.dart';

class FacebookLoginRepositoryImpl implements FacebookLoginRepository {
  @override
  Future<Either<AuthException, User>> signIn() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();
      final AccessToken? accessToken = result.accessToken;

      if (accessToken == null) {
        return Left(AuthException('Não foi possível fazer login com Facebook'));
      }

      final AuthCredential credential =
          FacebookAuthProvider.credential(accessToken.token);

      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      final User? user = userCredential.user;

      if (user == null) {
        return Left(AuthException('Não foi possível fazer login com Facebook'));
      }

      return Right(user);
    } on Exception catch (e, s) {
      log('Facebook sign in error', stackTrace: s, error: e);
      return Left(AuthException('Não foi possível fazer login com Facebook'));
    }
  }

  @override
  Future<Either<AuthException, void>> signOut() async {
    try {
      await FacebookAuth.instance.logOut();
      await FirebaseAuth.instance.signOut();
      return const Right(null);
    } on Exception catch (e, s) {
      log('Facebook sign out error', stackTrace: s, error: e);
      return Left(
          AuthException('Não foi possível fazer o sign out com Facebook'));
    }
  }

  @override
  bool isFacebookLoggedIn() {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return false;
    }

    for (final info in user.providerData) {
      if (info.providerId == 'facebook.com') {
        return true;
      }
    }

    return false;
  }
}
