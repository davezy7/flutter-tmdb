import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb/data/repository/tmdb_repository_impl.dart';
import 'package:tmdb/domain/model/api_result.dart';
import 'package:tmdb/domain/model/movie_list_model.dart';
import 'package:tmdb/domain/repository/tmdb_repository.dart';
import 'package:tmdb/presentation/component/ui_state.dart';

class DashboardCubit extends Cubit<UiState<List<MovieListModel>>> {
  DashboardCubit() : super(StateInitial());

  final TmdbRepository _repository = TmdbRepositoryImpl();
  final int _currentPage = 1;

  void getNowPlayingMovies() {
    emit(StateLoading());
    _repository.getNowPlayingMovies(_currentPage).then((repoCall) {
      if (repoCall is ApiSuccess<List<MovieListModel>>) {
        emit(StateSuccess(data: (repoCall).data));
      } else {
        emit(StateFailed(errorMsg: (repoCall as ApiFailed).errorMsg));
      }
    });
  }

  void incrementPage() => _currentPage + 1;
}
