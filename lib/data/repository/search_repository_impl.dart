import 'package:tmdb/data/entity/response/movie_response.dart';
import 'package:tmdb/data/source/remote/search_remote_source.dart';
import 'package:tmdb/data/source/remote/search_remote_source_impl.dart';
import 'package:tmdb/domain/model/api_result.dart';
import 'package:tmdb/domain/model/movie_list_wrapper_model.dart';
import 'package:tmdb/domain/repository/search_repository.dart';

class SearchRepositoryImpl implements SearchRepository {
  final SearchRemoteSource _remoteSource = SearchRemoteSourceImpl();

  @override
  Future<ApiResult<MovieListWrapperModel>> searchMovies(String searchQuery, int page) async {
    final apiCall = await _remoteSource.searchMovie(searchQuery, page);
    return switch (apiCall) {
      ApiSuccess<MovieListResponse>() => ApiSuccess(apiCall.data.toModel()),
      ApiFailed<MovieListResponse>() => ApiFailed(apiCall.errorMsg)
    };
  }
}