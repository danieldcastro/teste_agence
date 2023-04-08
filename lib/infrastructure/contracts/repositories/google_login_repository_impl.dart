import 'dart:developer';

import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../domain/contracts/repositories/google_login_repository.dart';
import '../../errors/auth_exception.dart';

class GoogleLoginRepositoryImpl implements GoogleLoginRepository {
  @override
  Future<Either<AuthException, UserCredential>> signIn() async {
    OAuthCredential? credential;
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        return Left(AuthException(
            'Selecione um usuário para fazer login com Google e tente novamente.'));
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
    } on Exception catch (e, s) {
      log('Google login error', stackTrace: s, error: e);
      return Left(AuthException('Não foi possível fazer login com Google'));
    }
    return Right(await FirebaseAuth.instance.signInWithCredential(credential));
  }

  @override
  Future<Either<AuthException, void>> signOut() async {
    try {
      return Right(await FirebaseAuth.instance.signOut());
    } on Exception catch (e, s) {
      log('Google sign out error', stackTrace: s, error: e);
      return Left(
          AuthException('Não foi possível fazer o sign out com Google'));
    }
  }
}
