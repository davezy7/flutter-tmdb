import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb/domain/model/movie_list_model.dart';
import 'package:tmdb/navigation/tmdb_navigator.dart';
import 'package:tmdb/presentation/component/common_loading.dart';
import 'package:tmdb/presentation/component/common_reload.dart';
import 'package:tmdb/presentation/component/tmdb_list_item.dart';
import 'package:tmdb/presentation/util/state/ui_state.dart';
import 'package:tmdb/presentation/screens/dashboard/cubit/upcoming_cubit.dart';

class DashboardUpcomingSection extends StatefulWidget {
  const DashboardUpcomingSection({super.key});

  @override
  State<DashboardUpcomingSection> createState() =>
      _DashboardUpcomingSectionState();
}

class _DashboardUpcomingSectionState extends State<DashboardUpcomingSection>
    with AutomaticKeepAliveClientMixin<DashboardUpcomingSection> {
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
    if (_hasReachedBottom) {
      context.read<UpcomingCubit>().incrementPage();
      context.read<UpcomingCubit>().getUpcomingMovies();
    }
  }

  bool get _hasReachedBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<UpcomingCubit, UiState<List<MovieListModel>>>(
      builder: (context, state) => switch (state) {
        StateInitial() => const SizedBox(),
        StateLoading() => Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(32),
            child: const CommonLoading(),
          ),
        _ => _upcomingSection(state)
      },
    );
  }

  Widget _upcomingSection(UiState<List<MovieListModel>> state) {
    if (state is StateFailed) {
      return CommonReload(
          onRetry: () => context.read<UpcomingCubit>().getUpcomingMovies());
    }
    if (state is StateSuccess<List<MovieListModel>> && state.data.isEmpty) {
      return const Center(child: Text("Data is empty"));
    }

    final List<MovieListModel> movieList =
        (state as StateSuccess<List<MovieListModel>>).data;
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) =>
          index == movieList.length
              ? state is StateFailed
                  ? CommonReload(
                      onRetry: () =>
                          context.read<UpcomingCubit>().getUpcomingMovies(),
                    )
                  : const Padding(
                      padding: EdgeInsets.all(16),
                      child: CommonLoading(),
                    )
              : TmdbListItem(
                  movieList[index],
                  onItemClicked: (id) {
                    Navigator.push(context, TmdbNavigator.getDetailRoute(id));
                  },
                ),
      itemCount: context.read<UpcomingCubit>().hasReachedMax
          ? movieList.length
          : movieList.length + 1,
      controller: _scrollController,
    );
  }

  @override
  bool get wantKeepAlive => true;
}
