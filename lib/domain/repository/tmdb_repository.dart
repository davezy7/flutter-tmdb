import 'package:tmdb/domain/model/api_result.dart';
import 'package:tmdb/domain/model/movie_list_wrapper_model.dart';

abstract class TmdbRepository {
  Future<ApiResult<MovieListWrapperModel>> getNowPlayingMovies(int page);
}
