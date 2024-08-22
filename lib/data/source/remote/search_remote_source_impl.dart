import 'package:tmdb/config/microservice.dart';
import 'package:tmdb/data/entity/response/movie_response.dart';
import 'package:tmdb/data/source/base/base_remote_source.dart';
import 'package:tmdb/data/source/remote/search_remote_source.dart';
import 'package:tmdb/domain/model/api_result.dart';

final class SearchRemoteSourceImpl extends BaseRemoteSource
    implements SearchRemoteSource {

  @override
  Future<ApiResult<MovieListResponse>> searchMovie(String searchQuery, int page) =>
      getApiResult(
          apiCall: () => getDio().get("${Microservice.v3Search}/movie",
              queryParameters: {'query': searchQuery, 'page': page}),
          mapper: (data) => MovieListResponse.fromJson(data));
}
