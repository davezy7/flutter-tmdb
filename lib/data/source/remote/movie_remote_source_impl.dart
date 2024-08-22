import 'package:tmdb/config/microservice.dart';
import 'package:tmdb/data/entity/response/movie_detail_response.dart';
import 'package:tmdb/data/entity/response/movie_response.dart';
import 'package:tmdb/data/source/base/base_remote_source.dart';
import 'package:tmdb/data/source/remote/movie_remote_source.dart';
import 'package:tmdb/domain/model/api_result.dart';

final class MovieRemoteSourceImpl extends BaseRemoteSource
    implements MovieRemoteSource {
  @override
  Future<ApiResult<MovieListResponse>> getNowPlayingMovies(int page) =>
      getApiResult(
          apiCall: () => getDio().get("${Microservice.v3Movie}/now_playing",
              queryParameters: {'page': page}),
          mapper: (data) => MovieListResponse.fromJson(data));

  @override
  Future<ApiResult<MovieListResponse>> getUpcomingMovies(int page) =>
      getApiResult(
          apiCall: () => getDio().get("${Microservice.v3Movie}/upcoming",
              queryParameters: {'page': page}),
          mapper: (data) => MovieListResponse.fromJson(data));

  @override
  Future<ApiResult<MovieListResponse>> getPopularMovies() => getApiResult(
        apiCall: () => getDio().get("${Microservice.v3Movie}/popular"),
        mapper: (data) => MovieListResponse.fromJson(data),
      );

  @override
  Future<ApiResult<MovieDetailResponse>> getMovieDetails(int movieId) =>
      getApiResult(
          apiCall: () => getDio().get("${Microservice.v3Movie}/$movieId"),
          mapper: (data) => MovieDetailResponse.fromJson(data));
}
