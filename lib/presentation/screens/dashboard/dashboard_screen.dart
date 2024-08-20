import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb/presentation/component/comp_toggle_tab.dart';
import 'package:tmdb/presentation/screens/dashboard/cubit/now_playing_cubit.dart';
import 'package:tmdb/presentation/screens/dashboard/section/dashboard_now_playing_section.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
    );
  }

  Widget errorWidget(String errorMsg) => Center(child: Text(errorMsg));
}
