import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb/navigation/tmdb_navigator.dart';
import 'package:tmdb/presentation/component/tmdb_search_bar.dart';
import 'package:tmdb/presentation/screens/dashboard/cubit/dashboard_search_cubit.dart';

class DashboardSearchSection extends StatelessWidget {
  const DashboardSearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardSearchCubit, String>(
      builder: (ctx, state) => TmdbSearchBar(
        label: "Search",
        onValueChanged: (value) =>
            ctx.read<DashboardSearchCubit>().updateText(value),
        onCompleted: () {
          Navigator.push(context, TmdbNavigator.toSearch(state));
        },
      ),
    );
  }
}
