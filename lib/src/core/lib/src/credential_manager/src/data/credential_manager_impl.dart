import 'package:core/core.dart';
import 'package:core/src/credential_manager/src/domain/interfaces/credential_manager.dart';
import 'package:flutter/cupertino.dart';

const _accessTokenKey = 'access_token_credential';
const _refreshTokenKey = 'refresh_token_credential';

class CredentialManagerImpl implements CredentialManager {
  final Storage storage;

  CredentialManagerImpl(this.storage);

  @override
  Future<Either<Failure, TokenResult>> getAccessToken() =>
      getTokenResult(_accessTokenKey);

  @override
  Future<Either<Failure, TokenResult>> getRefreshToken() =>
      getTokenResult(_refreshTokenKey);

  @override
  Future<Either<Failure, bool>> setAccessToken(TokenResult token) =>
      setToken(_accessTokenKey, token);

  @override
  Future<Either<Failure, bool>> setRefreshToken(TokenResult token) =>
      setToken(_refreshTokenKey, token);

  @override
  Future<Either<Failure, bool>> clearTokens() async {
    final isAccessTokenDeleted =
        await storage.deleteValue(key: _accessTokenKey);
    final isRefreshTokenDeleted =
        await storage.deleteValue(key: _refreshTokenKey);
    if (isAccessTokenDeleted.isLeft || isRefreshTokenDeleted.isLeft) {
      return Left(
        GenericFailure(message: "Failed to clear tokens"),
      );
    }
    return Right(true);
  }

  @override
  Future<bool> isAccessTokenValid() async {
    final result = await getAccessToken();
    return isTokenValid(result);
  }

  @override
  Future<bool> isRefreshTokenValid() async {
    final result = await getRefreshToken();
    return isTokenValid(result);
  }

  @visibleForTesting
  Future<Either<Failure, TokenResult>> getTokenResult(String key) async {
    final result = await storage.getValue<Json>(key: key);
    if (result.isLeft) {
      return Left(
        GenericFailure(message: "Failed to retrieve token: $key"),
      );
    }
    return Right(TokenResult.fromJson(result.right));
  }

  @visibleForTesting
  Future<Either<Failure, bool>> setToken(String key, TokenResult token) async {
    final result = await storage.saveValue<Json>(
        key: _accessTokenKey, value: token.toJson());
    if (result.isLeft)
      return Left(GenericFailure(message: "Failed to store token: $key"));
    return Right(true);
  }

  @visibleForTesting
  bool isTokenValid(Either<Failure, TokenResult> tokenResult) {
    if (tokenResult.isLeft) return false;
    final tokenExpirationDate = tokenResult.right.expiresAt;

    // Subtract 10 seconds from the token expiration date
    // to add an error margin time for the request that will use it
    final isAfterNow = tokenExpirationDate
        ?.subtract(Duration(seconds: 10))
        .isAfter(DateTime.now());

    return isAfterNow ?? false;
  }
}
