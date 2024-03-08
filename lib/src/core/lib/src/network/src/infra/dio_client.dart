import '../data/interfaces/http_client.dart';
import '../domain/entities/network_request.dart';
import 'package:dio/dio.dart';

import '../domain/utils/network_request_method.dart';
import '../domain/utils/network_response_type.dart';

class DioClient implements HttpClient {
  final Dio dio;

  DioClient(this.dio);

  @override
  Future<Map<String, dynamic>> request(NetworkRequest request) async {
    final options = Options(
      contentType: request.contentType?.name,
      headers: request.headers,
      responseType: request.responseType?.toDioType(),
      sendTimeout: request.timeout,
    );

    switch (request.method) {
      case NetworkRequestMethod.get:
        final result = (await dio.get(
          request.url,
          queryParameters: request.queryParameters,
          options: options,
        ))
            .toMap();
        print(result);
        return result;
      case NetworkRequestMethod.post:
        return (await dio.post(
          request.url,
          queryParameters: request.queryParameters,
          data: request.body,
          options: options,
        ))
            .toMap();
      case NetworkRequestMethod.put:
        return (await dio.post(
          request.url,
          queryParameters: request.queryParameters,
          data: request.body,
          options: options,
        ))
            .toMap();
      case NetworkRequestMethod.patch:
        return (await dio.post(
          request.url,
          queryParameters: request.queryParameters,
          data: request.body,
          options: options,
        ))
            .toMap();
      case NetworkRequestMethod.delete:
        return (await dio.post(
          request.url,
          queryParameters: request.queryParameters,
          options: options,
        ))
            .toMap();
    }
  }
}

extension on NetworkResponseType {
  ResponseType toDioType() {
    switch (this) {
      case NetworkResponseType.json:
        return ResponseType.json;
      case NetworkResponseType.plain:
        return ResponseType.plain;
      case NetworkResponseType.bytes:
        return ResponseType.bytes;
      case NetworkResponseType.stream:
        return ResponseType.stream;
    }
  }
}

extension on Response {
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "url": realUri.host + realUri.path,
      "method": requestOptions.method,
      "headers": requestOptions.headers,
      "statusCode": statusCode,
      "data": data,
    };
  }
}
