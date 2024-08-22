import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb/domain/model/movie_detail_model.dart';
import 'package:tmdb/presentation/component/common_loading.dart';
import 'package:tmdb/presentation/component/common_reload.dart';
import 'package:tmdb/presentation/component/tmdb_image_loader.dart';
import 'package:tmdb/presentation/component/tmdb_toggle_tab.dart';
import 'package:tmdb/presentation/screens/details/cubit/details_cubit.dart';
import 'package:tmdb/presentation/util/state/ui_state.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.movieId});

  final int movieId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (_) => DetailsCubit()
            ..setMovieId(movieId)
            ..getMovieDetails(),
          child: BlocBuilder<DetailsCubit, UiState<MovieDetailModel>>(
            builder: (ctx, state) => switch (state) {
              StateInitial() => const SizedBox(),
              StateLoading() => Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(32),
                  child: const CommonLoading(),
                ),
              StateFailed() => CommonReload(
                  onRetry: () => ctx.read<DetailsCubit>().getMovieDetails),
              StateSuccess() => _successPage(context, state.data),
            },
          ),
        ),
      ),
    );
  }

  Widget _successPage(BuildContext context, MovieDetailModel movie) {
    return Stack(
      children: [
        TmdbImageLoader(
          imageUrl: movie.backdropPath,
          width: MediaQuery.of(context).size.width,
          height: 250,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 180, left: 16, right: 16),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TmdbImageLoader(imageUrl: movie.posterPath, width: 100),
                    const SizedBox(width: 16),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 75),
                          Text(
                            movie.title,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            movie.genres.join(', '),
                            style: const TextStyle(
                              fontSize: 12,
                              fontStyle: FontStyle.italic,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 32),
              Expanded(
                child: TmdbToggleTab(
                  children: [
                    ToggleTabItemModel(
                      title: "About Movie",
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        child: Text(movie.overview, textAlign: TextAlign.justify),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
