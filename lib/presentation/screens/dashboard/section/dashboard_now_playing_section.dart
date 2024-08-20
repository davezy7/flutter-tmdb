import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb/domain/model/movie_list_model.dart';
import 'package:tmdb/presentation/component/common_loading.dart';
import 'package:tmdb/presentation/component/ui_state.dart';
import 'package:tmdb/presentation/screens/dashboard/cubit/now_playing_cubit.dart';
import 'package:tmdb/presentation/screens/dashboard/widgets/dashboard_list_item_widget.dart';
import 'package:tmdb/util/extensions.dart';

class DashboardNowPlayingSection extends StatefulWidget {
  const DashboardNowPlayingSection({super.key});

  @override
  State<DashboardNowPlayingSection> createState() =>
      _DashboardNowPlayingSectionState();
}

class _DashboardNowPlayingSectionState
    extends State<DashboardNowPlayingSection> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onBottomReached);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onBottomReached)
      ..dispose();
    super.dispose();
  }

  void _onBottomReached() {
    if (!_scrollController.hasClients) return;
    if (_scrollController.position.atEdge &&
        _scrollController.position.pixels > 0) {
      context.read<NowPlayingCubit>().incrementPage();
      context.read<NowPlayingCubit>().getNowPlayingMovies();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NowPlayingCubit, UiState<List<MovieListModel>>>(
      builder: (context, state) => Scaffold(
        body: switch (state) {
          StateInitial() => const SizedBox(),
          StateLoading() => const CommonLoading(),
          StateSuccess() => _successWidget(state.data),
          StateFailed() => _errorWidget(state.errorMsg.orDefault("Error Brow")),
        },
      ),
    );
  }

  Widget _successWidget(List<MovieListModel> movieList) {
    if (movieList.isEmpty) {
      return const Center(child: Text("Data is empty"));
    }
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) => DashboardListItemWidget(
        id: movieList[index].id,
        item: movieList[index],
      ),
      itemCount: movieList.length,
      controller: _scrollController,
    );
  }

  Widget _errorWidget(String errorMsg) => Center(child: Text(errorMsg));
}
