import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb/data/repository/tmdb_repository_impl.dart';
import 'package:tmdb/domain/model/api_result.dart';
import 'package:tmdb/domain/model/movie_list_model.dart';
import 'package:tmdb/domain/repository/tmdb_repository.dart';
import 'package:tmdb/presentation/component/ui_state.dart';

class DashboardCubit extends Cubit<UiState<List<MovieListModel>>> {
  DashboardCubit() : super(StateInitial());

  final TmdbRepository _repository = TmdbRepositoryImpl();
  final List<MovieListModel> movieList = List.empty(growable: true);
  int _currentPage = 1;

  void getNowPlayingMovies() {
    if (movieList.isEmpty) emit(StateLoading());
    _repository.getNowPlayingMovies(_currentPage).then((repoCall) {
      switch (repoCall) {
        case ApiSuccess<List<MovieListModel>>():
          movieList.addAll(repoCall.data);
          emit(StateSuccess(data: movieList));
          break;
        case ApiFailed<List<MovieListModel>>():
          emit(StateFailed(errorMsg: repoCall.errorMsg));
          break;
      }
    });
  }

  void incrementPage() => _currentPage += 1;
}
