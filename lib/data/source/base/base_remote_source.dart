import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:tmdb/config/env.dart';
import 'package:tmdb/domain/model/api_result.dart';

base class BaseRemoteSource {
  final _timeoutDuration = const Duration(seconds: 5);
  final _headers = Map<String, String>.of({
    "Authorization": "Bearer ${Env.apiKey}",
    "Content-Type": "application/json"
  });

  @protected
  Dio getDio() => Dio(
        BaseOptions(
            baseUrl: Env.baseUrl,
            connectTimeout: _timeoutDuration,
            receiveTimeout: _timeoutDuration,
            headers: _headers),
      )..interceptors.add(LogInterceptor());

  @protected
  Future<ApiResult<T>> getApiResult<T>(
      {required Future<Response<dynamic>> Function() apiCall,
      required T Function(Map<String, dynamic>) mapper}) async {
    try {
      final response = await apiCall();
      return response.statusCode == 200 && response.data != null
          ? ApiSuccess(mapper(response.data))
          : ApiFailed(response.statusMessage);
    } on DioException catch (e) {
      return switch (e.type) {
        DioExceptionType.connectionTimeout => ApiFailed("Connection Timeout"),
        DioExceptionType.sendTimeout => ApiFailed("Send Timeout"),
        DioExceptionType.receiveTimeout => ApiFailed("Receive Timeout"),
        DioExceptionType.connectionError =>
          ApiFailed("Please check your connection"),
        _ => ApiFailed(e.toString())
      };
    }
  }
}
