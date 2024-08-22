import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb/data/repository/movie_repository_impl.dart';
import 'package:tmdb/domain/model/api_result.dart';
import 'package:tmdb/domain/model/movie_list_model.dart';
import 'package:tmdb/domain/repository/movie_repository.dart';
import 'package:tmdb/presentation/util/state/ui_state.dart';

class PopularCubit extends Cubit<UiState<List<MovieListModel>>> {
  PopularCubit() : super(StateInitial());

  final MovieRepository _repository = MovieRepositoryImpl();

  void getPopularMovies() {
    emit(StateLoading());
    _repository.getPopularMovies().then((repoCall) {
      switch (repoCall) {
        case ApiSuccess<List<MovieListModel>>():
          emit(StateSuccess(data: repoCall.data));
          break;
        case ApiFailed<List<MovieListModel>>():
          emit(StateFailed(errorMsg: repoCall.errorMsg));
          break;
      }
    });
  }
}
