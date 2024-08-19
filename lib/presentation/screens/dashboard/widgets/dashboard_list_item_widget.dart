import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tmdb/domain/model/movie_list_model.dart';

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
          SizedBox(
            width: 100,
            height: 150,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              child: CachedNetworkImage(
                key: Key(item.posterPath),
                imageUrl: item.posterPath,
                progressIndicatorBuilder: (context, url, progress) => Center(
                  child: CircularProgressIndicator(
                    key: Key(url),
                    value: progress.progress,
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
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
