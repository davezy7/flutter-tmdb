import 'package:tmdb/data/entity/response/movie_detail_response.dart';
import 'package:tmdb/data/entity/response/movie_response.dart';
import 'package:tmdb/data/source/remote/movie_remote_source.dart';
import 'package:tmdb/data/source/remote/movie_remote_source_impl.dart';
import 'package:tmdb/domain/model/api_result.dart';
import 'package:tmdb/domain/model/movie_detail_model.dart';
import 'package:tmdb/domain/model/movie_list_model.dart';
import 'package:tmdb/domain/model/movie_list_wrapper_model.dart';
import 'package:tmdb/domain/repository/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteSource _remoteSource = MovieRemoteSourceImpl();

  @override
  Future<ApiResult<MovieListWrapperModel>> getNowPlayingMovies(int page) async {
    final apiCall = await _remoteSource.getNowPlayingMovies(page);
    return switch (apiCall) {
      ApiSuccess<MovieListResponse>() => ApiSuccess(apiCall.data.toModel()),
      ApiFailed<MovieListResponse>() => ApiFailed(apiCall.errorMsg)
    };
  }

  @override
  Future<ApiResult<MovieListWrapperModel>> getUpcomingMovies(int page) async {
    final apiCall = await _remoteSource.getUpcomingMovies(page);
    return switch (apiCall) {
      ApiSuccess<MovieListResponse>() => ApiSuccess(apiCall.data.toModel()),
      ApiFailed<MovieListResponse>() => ApiFailed(apiCall.errorMsg)
    };
  }

  @override
  Future<ApiResult<List<MovieListModel>>> getPopularMovies() async {
    final apiCall = await _remoteSource.getPopularMovies();
    if (apiCall is ApiSuccess<MovieListResponse>) {
      final mappedData = apiCall.data.toModel();
      return ApiSuccess(mappedData.movies);
    }
    return ApiFailed((apiCall as ApiFailed).errorMsg);
  }

  @override
  Future<ApiResult<MovieDetailModel>> getMovieDetails(int movieId) async {
    final apiCall = await _remoteSource.getMovieDetails(movieId);
    return switch (apiCall) {
      ApiSuccess<MovieDetailResponse>() => ApiSuccess(apiCall.data.toModel()),
      ApiFailed<MovieDetailResponse>() => ApiFailed(apiCall.errorMsg)
    };
  }
}