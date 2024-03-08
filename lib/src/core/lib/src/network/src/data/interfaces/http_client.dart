import '../../domain/entities/network_request.dart';

abstract interface class HttpClient {
  Future<Map<String, dynamic>> request(NetworkRequest request);
}
