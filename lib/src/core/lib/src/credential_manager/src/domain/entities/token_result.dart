import 'package:core/core.dart';

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

  Json toJson() => {
        'value': value,
        'expiresAt': expiresAt,
      };
}
