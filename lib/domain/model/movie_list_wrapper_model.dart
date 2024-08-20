import 'package:tmdb/domain/model/movie_list_model.dart';

class MovieListWrapperModel {
  final int page;
  final int totalPages;
  final List<MovieListModel> movies;
  MovieListWrapperModel({
    required this.page,
    required this.totalPages,
    required this.movies,
  });
}
