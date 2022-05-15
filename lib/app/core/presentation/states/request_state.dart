import '../../domain/errors/errors.dart';

abstract class RequestState {}

class StartState implements RequestState {
  const StartState();
}

class LoadingState implements RequestState {
  const LoadingState();
}

class ErrorState implements RequestState {
  final Failure error;
  const ErrorState(this.error);
}

class SuccessState<T> implements RequestState {
  final T data;
  const SuccessState(this.data);
}
