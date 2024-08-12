import 'package:dio/dio.dart';

final networkClient = Dio(
  BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3/movie/',
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 5),
  ),
);
