import 'package:tmdb/domain/model/api_result.dart';
import 'package:tmdb/domain/model/movie_list_wrapper_model.dart';

abstract class SearchRepository {
  Future<ApiResult<MovieListWrapperModel>> searchMovies(String searchQuery, int page);
}