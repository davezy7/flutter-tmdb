import 'package:flutter/material.dart';
import 'package:tmdb/domain/model/movie_list_model.dart';
import 'package:tmdb/presentation/component/tmdb_image_loader.dart';
import 'package:tmdb/presentation/theme/tmdb_colors.dart';
import 'package:tmdb/util/extensions.dart';

class TmdbListItem extends StatelessWidget {
  const TmdbListItem(this.item, {super.key, this.onItemClicked});

  final MovieListModel item;
  final void Function(int movie)? onItemClicked;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onItemClicked?.call(item.id);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            key: Key(item.id.toString()),
            children: [
              TmdbImageLoader(imageUrl: item.posterPath, width: 100, height: 150),
              const SizedBox(width: 12),
              Expanded(
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
                      item.releaseDate.getYear(),
                      key: Key(item.title + item.releaseDate),
                    ),
                    const Spacer(),
                    Text(
                      item.voteAverage.toStringAsFixed(1),
                      key: Key(item.title + item.voteAverage.toString()),
                      style: const TextStyle(color: TmdbColors.orange),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
