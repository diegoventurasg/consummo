abstract class Failure implements Exception {
  String? get message;
}

class InvalidId extends Failure {
  @override
  final String? message;
  InvalidId({this.message});
}

class InvalidParam extends Failure {
  @override
  final String? message;
  InvalidParam({this.message});
}

class InvalidResult extends Failure {
  @override
  final String? message;
  InvalidResult({this.message});
}

class EmptyResult extends Failure {
  @override
  final String? message;
  EmptyResult({this.message});
}

class InternalError extends Failure {
  @override
  final String? message;
  InternalError({this.message});
}

class DatasourceNull extends Failure {
  @override
  final String? message;
  DatasourceNull({this.message});
}
