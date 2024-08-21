import 'package:tmdb/domain/model/api_result.dart';
import 'package:tmdb/domain/model/movie_list_model.dart';
import 'package:tmdb/domain/model/movie_list_wrapper_model.dart';

abstract class MovieRepository {
  Future<ApiResult<MovieListWrapperModel>> getNowPlayingMovies(int page);
  Future<ApiResult<MovieListWrapperModel>> getUpcomingMovies(int page);
  Future<ApiResult<List<MovieListModel>>> getPopularMovies();
}