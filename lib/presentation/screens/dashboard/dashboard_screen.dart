import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb/domain/model/movie_list_model.dart';
import 'package:tmdb/presentation/component/common_loading.dart';
import 'package:tmdb/presentation/component/ui_state.dart';
import 'package:tmdb/presentation/screens/dashboard/cubit/dashboard_cubit.dart';
import 'package:tmdb/presentation/screens/dashboard/widgets/dashboard_success_widget.dart';
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
                  StateLoading() => const CommonLoading(),
                  StateSuccess() =>
                    DashboardSuccessWidget(movieList: state.data),
                  StateFailed() =>
                    errorWidget(state.errorMsg.orDefault("Error Brow")),
                },
              )),
    );
  }

  Widget errorWidget(String errorMsg) => Center(child: Text(errorMsg));
}
