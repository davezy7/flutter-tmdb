import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb/domain/model/movie_list_model.dart';
import 'package:tmdb/navigation/tmdb_navigator.dart';
import 'package:tmdb/presentation/component/common_loading.dart';
import 'package:tmdb/presentation/component/common_reload.dart';
import 'package:tmdb/presentation/component/tmdb_image_loader.dart';
import 'package:tmdb/presentation/theme/tmdb_colors.dart';
import 'package:tmdb/presentation/util/state/ui_state.dart';
import 'package:tmdb/presentation/screens/dashboard/cubit/popular_cubit.dart';

class DashboardPopularSection extends StatefulWidget {
  const DashboardPopularSection({super.key});

  @override
  State<DashboardPopularSection> createState() =>
      _DashboardPopularSectionState();
}

class _DashboardPopularSectionState extends State<DashboardPopularSection> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularCubit, UiState<List<MovieListModel>>>(
      builder: (context, state) => switch (state) {
        StateInitial() => const SizedBox(),
        StateLoading() => const Center(child: CommonLoading()),
        StateFailed() => Center(
            child: CommonReload(
                onRetry: () => context.read<PopularCubit>().getPopularMovies()),
          ),
        StateSuccess() => ListView.builder(
            controller: ScrollController(),
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: _popularItem(index, state.data[index]),
            ),
            itemCount: 10,
            scrollDirection: Axis.horizontal,
          ),
      },
    );
  }

  Widget _popularItem(int index, MovieListModel movie) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(context, TmdbNavigator.toDetailRoute(movie.id));
          },
          child: Container(
              padding: const EdgeInsets.only(left: 16, right: 8),
              alignment: Alignment.topRight,
              child: TmdbImageLoader(
                imageUrl: movie.posterPath,
                height: 225,
                width: 150,
              )),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Stack(
            children: [
              Text(
                (index + 1).toString(),
                style: TextStyle(
                  fontSize: 72,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 2
                    ..color = TmdbColors.orange,
                ),
              ),
              Text(
                (index + 1).toString(),
                style: TextStyle(
                  fontSize: 72,
                  color: Theme.of(context).colorScheme.surface,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
