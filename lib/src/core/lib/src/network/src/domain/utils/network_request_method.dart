enum NetworkRequestMethod {
  get('GET'),
  put('PUT'),
  post('POST'),
  delete('DELETE'),
  patch('PATCH');

  final String name;

  const NetworkRequestMethod(this.name);
}