import 'package:flutter/material.dart';
import 'package:tmdb/presentation/screens/details/details_screen.dart';

abstract final class TmdbNavigator {
  static MaterialPageRoute<dynamic> getDetailRoute(int movieId) =>
      MaterialPageRoute(builder: (_) => DetailsScreen(movieId: movieId));
}
