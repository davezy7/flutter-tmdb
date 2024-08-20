import 'package:flutter/material.dart';

class CommonLoading extends StatelessWidget {
  const CommonLoading(
      {super.key,
      this.message = "",
      this.strokeWidth = 2.0,
      this.height = 24,
      this.width = 24});

  final String message;
  final double strokeWidth;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: height,
            width: width,
            child: CircularProgressIndicator(strokeWidth: strokeWidth),
          ),
          if (message.isNotEmpty) const SizedBox(height: 8),
          if (message.isNotEmpty) Text(message)
        ],
      ),
    );
  }
}
