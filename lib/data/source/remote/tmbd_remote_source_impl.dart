import 'package:dio/dio.dart';
import 'package:tmdb/config/env.dart';
import 'package:tmdb/config/microservice.dart';
import 'package:tmdb/data/entity/response/movie_response.dart';
import 'package:tmdb/data/source/base/base_remote_source.dart';
import 'package:tmdb/data/source/remote/tmdb_remote_source.dart';
import 'package:tmdb/domain/model/api_result.dart';

final class TmbdRemoteSourceImpl extends BaseRemoteSource
    implements TmdbRemoteSource {
  @override
  Future<ApiResult<MovieListResponse>> getNowPlayingMovies(int page) async {
    try {
      final response = await getDio().get("${Microservice.v3Movie}/now_playing",
          queryParameters: {'page': page});
      return response.statusCode == 200 && response.data != null
          ? ApiSuccess(MovieListResponse.fromJson(response.data))
          : ApiFailed(response.statusMessage);
    } on DioException catch (e) {
      return ApiFailed(e.toString());
    }
  }
}
