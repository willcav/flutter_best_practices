abstract class HttpClient {
  Future<dynamic> request({
    required String url,
    required RequestMethod method,
    Map<String, dynamic> queryParameters = const {},
    Map<String, dynamic> body = const {},
    Map<String, dynamic> headers = const {},
    List<Map<String, dynamic>> files = const [],
  });
}

enum RequestMethod {
  get,
  put,
  post,
  patch,
  delete,
}
