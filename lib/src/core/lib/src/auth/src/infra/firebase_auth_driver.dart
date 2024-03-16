import 'package:core/src/abstractions/either.dart';
import 'package:core/src/abstractions/failure.dart';
import 'package:core/src/auth/src/data/interfaces/auth_driver.dart';
import 'package:core/src/credential_manager/src/domain/entities/token_result.dart';
import 'package:core/src/credential_manager/src/domain/interfaces/credential_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthDriver implements AuthDriver {
  final CredentialManager credentialManager;

  FirebaseAuthDriver(this.credentialManager);

  @override
  Future<Either<Failure, TokenResult>> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final userToken = await credential.user?.getIdToken();
      final token = TokenResult.fromJwt(userToken ?? '');
      credentialManager.setAccessToken(token);

      return Right(token);
    } catch (e) {
      return Left(GenericFailure(message: '$e'));
    }
  }

  @override
  Future<Either<Failure, TokenResult>> signInWithFacebook() {
    // TODO: implement signInWithFacebook
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, TokenResult>> signInWithGoogle() async {
    // TODO: implement signInWithGoogle
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      return Right(null);
    } catch (e) {
      return Left(GenericFailure(message: '$e'));
    }
  }
}
