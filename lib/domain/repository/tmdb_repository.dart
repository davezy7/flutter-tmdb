import 'package:tmdb/domain/model/api_result.dart';
import 'package:tmdb/domain/model/movie_list_model.dart';

abstract class TmdbRepository {
  Future<ApiResult<List<MovieListModel>>> getNowPlayingMovies(int page);
}
