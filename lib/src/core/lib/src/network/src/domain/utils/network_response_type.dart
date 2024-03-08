enum NetworkResponseType {
  /// Transform the response data to JSON object only when the
  /// content-type of response is "application/json" .
  json('json'),

  /// Get the response stream directly,
  stream('stream'),

  /// Transform the response data to an UTF-8 encoded [String].
  plain('plain'),

  /// Get the original bytes, the [Response.data] will be [List<int>].
  bytes('bytes');

  final String name;

  const NetworkResponseType(this.name);
}