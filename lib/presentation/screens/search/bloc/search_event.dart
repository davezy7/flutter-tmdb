part of 'search_bloc.dart';

@immutable
abstract class SearchEvent {}

class SearchMovies extends SearchEvent {
  final String searchQuery;

  SearchMovies(this.searchQuery);
}
