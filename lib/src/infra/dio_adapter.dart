import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_clean_arch_error_handling/src/data/errors/http/http_error.dart';
import 'package:flutter_clean_arch_error_handling/src/data/http/http_client.dart';

class DioAdapter implements HttpClient {
  final Dio client;

  DioAdapter({
    required this.client,
  });

  @override
  Future request({
    required String url,
    required RequestMethod method,
    Map<String, dynamic> queryParameters = const {},
    Map<String, dynamic> body = const {},
    Map<String, dynamic> headers = const {},
    List<Map<String, dynamic>> files = const [],
  }) async {
    late final Map<String, dynamic> defaultHeaders;

    if (headers.isNotEmpty) {
      defaultHeaders = headers;
    } else {
      defaultHeaders = {'Content-Type': 'application/json', 'accept': 'application/json'};
    }

    late final FormData? formData;
    if (files.isNotEmpty) {
      formData = FormData.fromMap({
        'files': files.map((file) => MultipartFile.fromFileSync(file['path'], filename: file['fileName'])).toList()
      }..addAll(body.isNotEmpty ? body : {}));
    } else {
      formData = null;
    }

    late final Future<Response>? futureResponse;

    try {
      futureResponse = _getResponse(
        method: method,
        url: url,
        queryParameters: queryParameters,
        options: Options(
          headers: defaultHeaders,
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          },
        ),
        formData: formData,
        body: body,
      );

      // throw HttpError.badRequest(message: 'Bad request');

      final response = await futureResponse.timeout(const Duration(seconds: 5));
      return _handleResponse(response);
    } on DioError catch (error) {
      debugPrint(error.toString());
      if (error.type == DioErrorType.connectTimeout) {
        throw HttpError.timeOut();
      } else {
        throw HttpError.serverError();
      }
    } on HttpError catch (error) {
      debugPrint(error.toString());
      rethrow;
    }
  }

  Future<Response<dynamic>> _getResponse({
    required RequestMethod method,
    required String url,
    Options? options,
    Map<String, dynamic> queryParameters = const {},
    FormData? formData,
    Map<String, dynamic> body = const {},
  }) {
    if (method == RequestMethod.get) {
      return client.get(url, queryParameters: queryParameters, options: options);
    } else if (method == RequestMethod.put) {
      return client.put(url, data: formData ?? body, options: options);
    } else if (method == RequestMethod.post) {
      return client.post(url, data: formData ?? body, options: options);
    } else if (method == RequestMethod.patch) {
      return client.patch(url, data: formData ?? body, options: options);
    } else if (method == RequestMethod.delete) {
      return client.delete(url, queryParameters: queryParameters, options: options);
    } else {
      return client.get(url, queryParameters: queryParameters, options: options);
    }
  }

  dynamic _handleResponse(Response response) {
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.data;
    } else if (response.statusCode == 204) {
      return {};
    } else if (response.statusCode == 400) {
      throw HttpError.badRequest();
    } else if (response.statusCode == 401) {
      throw HttpError.unauthorized();
    } else if (response.statusCode == 403) {
      throw HttpError.forbidden();
    } else if (response.statusCode == 404) {
      throw HttpError.notFound();
    } else if (response.statusCode == 422) {
      throw HttpError.invalidData();
    } else {
      throw HttpError.serverError();
    }
  }
}
