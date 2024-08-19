import 'package:tmdb/data/entity/response/movie_response.dart';
import 'package:tmdb/data/source/remote/tmbd_remote_source_impl.dart';
import 'package:tmdb/data/source/remote/tmdb_remote_source.dart';
import 'package:tmdb/domain/model/api_result.dart';
import 'package:tmdb/domain/model/movie_list_model.dart';
import 'package:tmdb/domain/repository/tmdb_repository.dart';

class TmdbRepositoryImpl implements TmdbRepository {
  final TmdbRemoteSource _remoteSource = TmbdRemoteSourceImpl();

  @override
  Future<ApiResult<List<MovieListModel>>> getNowPlayingMovies(int page) async {
    final apiCall = await _remoteSource.getNowPlayingMovies(page);
    if (apiCall is ApiSuccess<MovieListResponse>) {
      final mappedData = apiCall.data.toModel();
      return ApiSuccess(mappedData);
    }
    return ApiFailed((apiCall as ApiFailed).errorMsg);
  }
}
