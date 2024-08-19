import 'package:meta/meta.dart';

@immutable
sealed class UiState<T> {}

final class StateInitial<T> extends UiState<T> {}

final class StateLoading<T> extends UiState<T> {}

final class StateSuccess<T> extends UiState<T> {
  final T data;

  StateSuccess({required this.data});
}

final class StateFailed<T> extends UiState<T> {
  final String? errorMsg;

  StateFailed({required this.errorMsg});
}
