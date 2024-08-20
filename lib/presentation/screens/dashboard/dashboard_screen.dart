import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb/presentation/component/tmdb_toggle_tab.dart';
import 'package:tmdb/presentation/screens/dashboard/cubit/now_playing_cubit.dart';
import 'package:tmdb/presentation/screens/dashboard/cubit/popular_cubit.dart';
import 'package:tmdb/presentation/screens/dashboard/section/dashboard_now_playing_section.dart';
import 'package:tmdb/presentation/screens/dashboard/section/dashboard_popular_section.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
              child: const Text(
                "What do you want to watch?",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              constraints: const BoxConstraints(maxHeight: 250),
              child: BlocProvider(
                create: (_) => PopularCubit()..getPopularMovies(),
                child: const DashboardPopularSection(),
              ),
            ),
            Expanded(
              child: TmdbToggleTab(
                children: [
                  ToggleTabItemModel(
                    title: "Now Playing",
                    child: BlocProvider(
                      create: (_) => NowPlayingCubit()..getNowPlayingMovies(),
                      child: const DashboardNowPlayingSection(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
