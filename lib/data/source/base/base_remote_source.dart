import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:tmdb/config/env.dart';

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
}
