import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb/data/repository/search_repository_impl.dart';
import 'package:tmdb/domain/model/api_result.dart';
import 'package:tmdb/domain/model/movie_list_model.dart';
import 'package:tmdb/domain/model/movie_list_wrapper_model.dart';
import 'package:tmdb/domain/repository/search_repository.dart';
import 'package:tmdb/presentation/util/state/ui_state.dart';

class SearchCubit extends Cubit<UiState<List<MovieListModel>>> {
  SearchCubit() : super(StateInitial());

  final SearchRepository _repository = SearchRepositoryImpl();
  final List<MovieListModel> _movieList = List.empty(growable: true);

  int _currentPage = 1;
  int _totalPages = 1;
  String _previousSearch =  "";
  String _currentSearch = "";

  bool get hasReachedMax => _currentPage == _totalPages;
  String get currentSearch => _currentSearch;

  void _searchMovies() {
    if (_currentSearch.isEmpty) return;
    if (_movieList.isEmpty ) emit(StateLoading());
    _previousSearch = _currentSearch;
    _repository.searchMovies(_currentSearch, _currentPage).then((repoCall) {
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

  void loadNewSearch() {
    if (_currentSearch != _previousSearch) {
      _currentPage = 1;
      _movieList.clear();
      _searchMovies();
    }
  }

  void loadMore() {
    _currentPage += 1;
    _searchMovies();
  }

  void updateSearch(String newText) => _currentSearch = newText;
}
