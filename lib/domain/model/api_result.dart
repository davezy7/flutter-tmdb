sealed class ApiResult<T> {}

class Success<T> implements ApiResult<T> {
  final T data;

  Success(this.data);
}

class Failed<T> implements ApiResult<T> {
  final String? errorMsg;

  Failed(this.errorMsg);
}
