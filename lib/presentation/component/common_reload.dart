import 'package:flutter/material.dart';
import 'package:tmdb/util/extensions.dart';

class CommonReload extends StatelessWidget {
  const CommonReload(
      {super.key, this.padding, this.message, required this.onRetry});

  final EdgeInsets? padding;
  final String? message;
  final void Function() onRetry;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(8),
      child: GestureDetector(
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
      ),
    );
  }
}
