abstract interface class Failure implements Exception {
  String? get message;
}

class GenericFailure extends Failure {
  @override
  final String? message;

  GenericFailure({this.message});
}
