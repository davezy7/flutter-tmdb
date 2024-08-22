import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb/domain/model/movie_list_model.dart';
import 'package:tmdb/presentation/component/tmdb_search_bar.dart';
import 'package:tmdb/presentation/screens/search/cubit/search_cubit.dart';
import 'package:tmdb/presentation/screens/search/search_list_section.dart';
import 'package:tmdb/presentation/util/state/ui_state.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key, required this.searchQuery});

  final String searchQuery;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => SearchCubit()
            ..updateSearch(searchQuery)
            ..loadNewSearch(),
          child: BlocBuilder<SearchCubit, UiState<List<MovieListModel>>>(
            builder: (ctx, state) => Column(
              children: [
                TmdbSearchBar(
                  label: "Search Movies",
                  controller: TextEditingController(
                    text: ctx.read<SearchCubit>().currentSearch,
                  ),
                  onValueChanged: (newText) =>
                      ctx.read<SearchCubit>().updateSearch(newText),
                  onCompleted: () => ctx.read<SearchCubit>().loadNewSearch(),
                ),
                SearchListSection(movieState: state)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
