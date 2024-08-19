import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb/domain/model/movie_list_model.dart';
import 'package:tmdb/presentation/screens/dashboard/cubit/dashboard_cubit.dart';
import 'package:tmdb/presentation/screens/dashboard/widgets/dashboard_list_item_widget.dart';

class DashboardSuccessWidget extends StatefulWidget {
  const DashboardSuccessWidget({super.key, required this.movieList});

  final List<MovieListModel> movieList;

  @override
  State<DashboardSuccessWidget> createState() => _DashboardSuccessWidgetState();
}

class _DashboardSuccessWidgetState extends State<DashboardSuccessWidget> {
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

  @override
  Widget build(BuildContext context) {
    if (widget.movieList.isEmpty) {
      return const Center(
        child: Text("Data is empty"),
      );
    }
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) => DashboardListItemWidget(
        id: widget.movieList[index].id,
        item: widget.movieList[index],
      ),
      itemCount: widget.movieList.length,
      controller: _scrollController,
    );
  }

  void _onBottomReached() {
    if (!_scrollController.hasClients) return;
    if (_scrollController.position.atEdge &&
        _scrollController.position.pixels > 0) {
      context.read<DashboardCubit>().incrementPage();
      context.read<DashboardCubit>().getNowPlayingMovies();
    }
  }
}
