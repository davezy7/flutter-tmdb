import 'package:flutter/material.dart';
import 'package:tmdb/domain/model/movie_list_model.dart';
import 'package:tmdb/presentation/component/tmdb_image_loader.dart';

class DashboardListItemWidget extends StatelessWidget {
  const DashboardListItemWidget(
      {super.key, required this.id, required this.item});

  final int id;
  final MovieListModel item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        key: Key(id.toString()),
        children: [
          TmdbImageLoader(imageUrl: item.posterPath, width: 100, height: 150),
          const SizedBox(width: 12),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  key: Key(item.title),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.start,
                ),
                Text(
                  "${item.voteAverage.toStringAsFixed(1)} / 10",
                  key: Key(item.voteAverage.toString()),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
