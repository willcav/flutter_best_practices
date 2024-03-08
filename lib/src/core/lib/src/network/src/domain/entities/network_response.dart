class NetworkResponse {
  final String url;
  final int statusCode;
  final Map<String, dynamic> headers;
  final Map<String, dynamic> data;

  NetworkResponse({
    required this.url,
    required this.statusCode,
    required this.headers,
    required this.data,
  });

  factory NetworkResponse.fromJson(Map<String, dynamic> json) {
    return NetworkResponse(
      url: json['url'],
      statusCode: json['statusCode'],
      headers: json['headers'],
      data: json['data'],
    );
  }

  NetworkResponse copyWith({
    String? url,
    int? statusCode,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? data,
  }) =>
      NetworkResponse(
        url: url ?? this.url,
        statusCode: statusCode ?? this.statusCode,
        headers: headers ?? this.headers,
        data: data ?? this.data,
      );
}
