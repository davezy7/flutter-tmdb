import 'package:flutter/material.dart';
import 'package:tmdb/util/extensions.dart';

class CommonReload extends StatelessWidget {
  const CommonReload({super.key, this.message, required this.onRetry});

  final String? message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onRetry,
      child: Row(
        children: [
          const Icon(Icons.refresh, size: 32),
          Text(
            message.orDefault("Try Again"),
            style: const TextStyle(fontSize: 16),
          )
        ],
      ),
    );
  }
}
