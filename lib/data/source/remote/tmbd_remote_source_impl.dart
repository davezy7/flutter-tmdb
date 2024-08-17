import 'package:dio/dio.dart';
import 'package:tmdb/config/microservice.dart';
import 'package:tmdb/data/entity/response/movie_response.dart';
import 'package:tmdb/data/network/network_client.dart';
import 'package:tmdb/data/source/base/base_remote_source.dart';
import 'package:tmdb/data/source/remote/tmdb_remote_source.dart';
import 'package:tmdb/domain/model/api_result.dart';

final class TmbdRemoteSourceImpl extends BaseRemoteSource
    implements TmdbRemoteSource {
  @override
  Future<ApiResult<MovieListResponse>> getNowPlayingMovies(int page) async {
    try {
      final response = await networkClient.get(
          "${Microservice.v3Movie}now_playing",
          queryParameters: {'page': page});
      return response.statusCode == 200 && response.data != null
          ? Success(response.data as MovieListResponse)
          : Failed(response.statusMessage);
    } on DioException catch (e) {
      return Failed(e.toString());
    }
  }
}
