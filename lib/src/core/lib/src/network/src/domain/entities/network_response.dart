import 'dart:convert';

import '../../../../utils/json_utils.dart';
import '../../../../utils/typedef.dart';
import '../utils/network_request_method.dart';

class NetworkResponse {
  final String url;
  final int statusCode;
  final NetworkRequestMethod method;
  final Map<String, dynamic> headers;
  final dynamic _data;

  Json get jsonData => JsonUtils.parseFromString(jsonEncode(_data)) ?? {};

  JsonList get jsonListData =>
      JsonListUtils.parseFromString(jsonEncode(_data)) ?? <Json>[];

  dynamic getData() => _data;

  NetworkResponse(
    this._data, {
    required this.url,
    required this.statusCode,
    required this.method,
    required this.headers,
  });

  factory NetworkResponse.fromJson(Map<String, dynamic> json) {
    return NetworkResponse(
      json['data'],
      url: json['url'],
      statusCode: json['statusCode'],
      method: (json['method']).toString().toRequestMethod() ??
          NetworkRequestMethod.get,
      headers: json['headers'],
    );
  }

  NetworkResponse copyWith({
    String? url,
    int? statusCode,
    NetworkRequestMethod? method,
    Map<String, dynamic>? headers,
    dynamic data,
  }) =>
      NetworkResponse(
        data ?? _data,
        url: url ?? this.url,
        statusCode: statusCode ?? this.statusCode,
        method: method ?? this.method,
        headers: headers ?? this.headers,
      );
}
