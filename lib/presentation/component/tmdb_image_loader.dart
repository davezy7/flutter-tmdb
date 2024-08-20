import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class TmdbImageLoader extends StatelessWidget {
  const TmdbImageLoader({
    super.key,
    required this.imageUrl,
    this.height = 150,
    this.width = 150,
  });

  final String imageUrl;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      key: Key(imageUrl),
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) => Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
        ),
      ),
      progressIndicatorBuilder: (context, url, progress) => SizedBox(
        height: height,
        width: width,
        child: Center(
          child: CircularProgressIndicator(
            key: Key(url),
            value: progress.progress,
          ),
        ),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
