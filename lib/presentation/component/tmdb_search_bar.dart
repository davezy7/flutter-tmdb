import 'package:flutter/material.dart';

class TmdbSearchBar extends StatelessWidget {
  const TmdbSearchBar(
      {super.key,
      required this.label,
      this.onValueChanged,
      this.onCompleted,
      this.controller});

  final String label;
  final ValueChanged<String>? onValueChanged;
  final VoidCallback? onCompleted;

  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: TextField(
        onChanged: onValueChanged,
        onEditingComplete: onCompleted,
        controller: controller,
        onTapOutside: (_) { FocusManager.instance.primaryFocus?.unfocus(); },
        decoration: const InputDecoration(
          labelText: 'Search',
          prefixIcon: Icon(Icons.search),
        ),
        textInputAction: TextInputAction.done,
      ),
    );
  }
}
