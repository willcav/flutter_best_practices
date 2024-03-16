import 'package:core/src/abstractions/either.dart';

import 'package:core/src/abstractions/failure.dart';
import 'package:core/src/auth/src/data/interfaces/auth_driver.dart';

import 'package:core/src/credential_manager/src/domain/entities/token_result.dart';

import '../domain/interfaces/auth.dart';

class AuthImpl implements Auth {
  final AuthDriver driver;

  AuthImpl(this.driver);

  @override
  Future<Either<Failure, TokenResult>> signInWithEmailAndPassword(
          String email, String password) =>
      driver.signInWithEmailAndPassword(email, password);

  @override
  Future<Either<Failure, TokenResult>> signInWithGoogle() =>
      driver.signInWithGoogle();

  @override
  Future<Either<Failure, TokenResult>> signInWithFacebook() =>
      driver.signInWithFacebook();

  @override
  Future<Either<Failure, void>> signOut() => driver.signOut();
}
