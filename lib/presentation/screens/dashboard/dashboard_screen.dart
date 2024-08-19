import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb/domain/model/movie_list_model.dart';
import 'package:tmdb/presentation/component/ui_state.dart';
import 'package:tmdb/presentation/screens/dashboard/cubit/dashboard_cubit.dart';
import 'package:tmdb/util/extensions.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DashboardCubit()..getNowPlayingMovies(),
      child: BlocBuilder<DashboardCubit, UiState<List<MovieListModel>>>(
          builder: (context, state) => Scaffold(
                body: switch (state) {
                  StateInitial() => const SizedBox(),
                  StateLoading() => loadingWidget(),
                  StateSuccess() => successWidget(state.data),
                  StateFailed() =>
                    errorWidget(state.errorMsg.orDefault("Error Brow")),
                },
              )),
    );
  }

  Widget loadingWidget() => const Center(child: CircularProgressIndicator());

  Widget successWidget(List<MovieListModel> data) {
    if (data.isEmpty) {
      return const Center(
        child: Text("Data is empty"),
      );
    }
    return ListView.builder(itemBuilder: (context, index) {
      return Column(
        children: [
          Text("Title: ${data[index].title}"),
          const SizedBox(
            height: 200,
          )
        ],
      );
    });
  }

  Widget errorWidget(String errorMsg) => Center(child: Text(errorMsg));
}
