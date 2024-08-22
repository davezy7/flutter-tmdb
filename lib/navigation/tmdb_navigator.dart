import 'package:flutter/material.dart';
import 'package:tmdb/presentation/screens/details/details_screen.dart';
import 'package:tmdb/presentation/screens/search/search_screen.dart';

abstract final class TmdbNavigator {
  static PageRouteBuilder toDetailRoute(int movieId) =>
      _buildRoute(DetailsScreen(movieId: movieId));

  static PageRouteBuilder toSearch(String searchQuery) =>
      _buildRoute(SearchScreen(searchQuery: searchQuery));

  static PageRouteBuilder _buildRoute(Widget child) => PageRouteBuilder(
      pageBuilder: (ctx, anim, secondAnim) => child,
      transitionsBuilder: (ctx, anim, secondAnim, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        final tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(position: anim.drive(tween), child: child);
      });
}
