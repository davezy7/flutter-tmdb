import 'package:tmdb/data/entity/response/movie_response.dart';
import 'package:tmdb/data/network/network_client.dart';
import 'package:tmdb/data/source/remote/tmdb_remote_source.dart';
import 'package:tmdb/domain/model/api_result.dart';

class TmbdRemoteSourceImpl implements TmdbRemoteSource {
  @override
  Future<ApiResult<MovieListResponse>> getNowPlayingMovies(int page) async {
    try {
      final response = await networkClient
          .get("now_playing", queryParameters: {'page': page});
      return response.statusCode == 200 && response.data != null
          ? Success(response.data as MovieListResponse)
          : Failed(response.statusMessage);
    } catch (e) {
      return Failed(e.toString());
    }
  }
}
