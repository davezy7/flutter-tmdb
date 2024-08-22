import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb/data/repository/movie_repository_impl.dart';
import 'package:tmdb/domain/model/api_result.dart';
import 'package:tmdb/domain/model/movie_detail_model.dart';
import 'package:tmdb/domain/repository/movie_repository.dart';
import 'package:tmdb/presentation/util/state/ui_state.dart';

class DetailsCubit extends Cubit<UiState<MovieDetailModel>> {
  DetailsCubit() : super(StateInitial());

  final MovieRepository _repository = MovieRepositoryImpl();
  int _movieId = 0;

  void getMovieDetails() {
    emit(StateLoading());
    _repository.getMovieDetails(_movieId).then((repoCall) {
      switch (repoCall) {
        case ApiSuccess<MovieDetailModel>():
          emit(StateSuccess(data: repoCall.data));
          break;
        case ApiFailed<MovieDetailModel>():
          emit(StateFailed(errorMsg: repoCall.errorMsg));
          break;
      }
    });
  }

  void setMovieId(int movieId) => _movieId = movieId;
}