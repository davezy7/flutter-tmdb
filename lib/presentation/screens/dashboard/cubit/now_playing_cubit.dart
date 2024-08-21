import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb/data/repository/movie_repository_impl.dart';
import 'package:tmdb/domain/model/api_result.dart';
import 'package:tmdb/domain/model/movie_list_model.dart';
import 'package:tmdb/domain/model/movie_list_wrapper_model.dart';
import 'package:tmdb/domain/repository/movie_repository.dart';
import 'package:tmdb/presentation/util/state/ui_state.dart';

class NowPlayingCubit extends Cubit<UiState<List<MovieListModel>>> {
  NowPlayingCubit() : super(StateInitial());

  final MovieRepository _repository = MovieRepositoryImpl();
  final List<MovieListModel> _movieList = List.empty(growable: true);
  int _currentPage = 1;
  int _totalPages = 1;

  void getNowPlayingMovies() {
    if (_movieList.isEmpty) emit(StateLoading());
    _repository.getNowPlayingMovies(_currentPage).then((repoCall) {
      switch (repoCall) {
        case ApiSuccess<MovieListWrapperModel>():
          _movieList.addAll(repoCall.data.movies);
          _totalPages = repoCall.data.totalPages;
          emit(StateSuccess(data: _movieList));
          break;
        case ApiFailed<MovieListWrapperModel>():
          emit(StateFailed(errorMsg: repoCall.errorMsg));
          break;
      }
    });
  }

  void incrementPage() => _currentPage += 1;

  bool get hasReachedMax => _currentPage == _totalPages;
}
