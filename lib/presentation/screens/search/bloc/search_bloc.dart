import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tmdb/presentation/util/state/ui_state.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, UiState> {
  SearchBloc() : super(StateInitial()) {

    on<SearchMovies>((event, emit) async {
      if (event.searchQuery.isEmpty) return;
      emit(StateLoading());

    });

  }
}
