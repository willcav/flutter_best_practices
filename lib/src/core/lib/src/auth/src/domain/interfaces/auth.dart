import 'package:core/core.dart';

abstract interface class Auth {
  Future<Either<Failure, TokenResult>> signInWithEmailAndPassword(
    String email,
    String password,
  );

  Future<Either<Failure, TokenResult>> signInWithGoogle();

  Future<Either<Failure, TokenResult>> signInWithFacebook();

  Future<Either<Failure, void>> signOut();
}
