import 'package:meta/meta.dart';

@immutable
sealed class ApiResult<T> {}

class ApiSuccess<T> extends ApiResult<T> {
  final T data;

  ApiSuccess(this.data);
}

class ApiFailed<T> extends ApiResult<T> {
  final String? errorMsg;

  ApiFailed(this.errorMsg);
}
