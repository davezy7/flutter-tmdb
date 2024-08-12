import 'package:tmdb/data/entity/response/movie_response.dart';
import 'package:tmdb/domain/model/api_result.dart';

abstract class TmdbRemoteSource {
  Future<ApiResult<MovieListResponse>> getNowPlayingMovies(int page);
}
