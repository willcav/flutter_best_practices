enum ContentType {
  json('application/json'),
  formUrlEncoded('application/x-www-form-urlencoded'),
  text('text/plain');

  final String name;

  const ContentType(this.name);
}
