enum NetworkRequestMethod {
  get('GET'),
  post('POST'),
  put('PUT'),
  patch('PATCH'),
  delete('DELETE');

  final String name;

  const NetworkRequestMethod(this.name);
}

extension RequestMethodFromString on String {
  NetworkRequestMethod? toRequestMethod() {
    switch (this) {
      case 'GET':
        return NetworkRequestMethod.get;
      case 'POST':
        return NetworkRequestMethod.post;
      case 'PUT':
        return NetworkRequestMethod.put;
      case 'PATCH':
        return NetworkRequestMethod.patch;
      case 'DELETE':
        return NetworkRequestMethod.delete;
      default:
        return null;
    }
  }
}
