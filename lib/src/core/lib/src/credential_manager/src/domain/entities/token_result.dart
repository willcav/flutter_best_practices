import 'package:core/core.dart';
import '../utils/jwt_decoder.dart';

class TokenResult {
  final String value;
  final DateTime? expiresAt;

  TokenResult({
    required this.value,
    required this.expiresAt,
  });

  factory TokenResult.fromJson(Json json) => TokenResult(
        value: json['value'] ?? '',
        expiresAt: DateUtils.fromString((json['expiresAt'] ?? '').toString()),
      );

  factory TokenResult.fromJwt(String token) {
    final expiresAt = JwtDecoder.getExpirationDate(token);
    return TokenResult(
      value: token,
      expiresAt: expiresAt,
    );
  }

  Json toJson() => {
        'value': value,
        'expiresAt': expiresAt,
      };
}
