import 'package:core/core.dart';

abstract interface class CredentialManager {
  Future<Either<Failure, TokenResult>> getAccessToken();

  Future<Either<Failure, TokenResult>> getRefreshToken();

  Future<Either<Failure, bool>> setAccessToken(TokenResult token);

  Future<Either<Failure, bool>> setRefreshToken(TokenResult token);

  Future<Either<Failure, bool>> clearTokens();

  Future<bool> isAccessTokenValid();

  Future<bool> isRefreshTokenValid();
}
