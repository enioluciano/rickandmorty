import 'package:projetorickmorty/app/modules/core/errors/failures.dart';

class NotFound extends Failure {}

abstract class NoInternetConnection extends Failure {
  NoInternetConnection() : super(erroMessage: 'No internet connection');
}

class GetListCharacterNoInternetConnection extends NoInternetConnection {}

class GetListCharacterError extends Failure {
  GetListCharacterError(
    StackTrace? stackTrace,
    String? label,
    dynamic exception,
    String errorMessage,
  ) : super(
            erroMessage: errorMessage,
            exception: exception,
            stackTrace: stackTrace,
            label: label);
}
