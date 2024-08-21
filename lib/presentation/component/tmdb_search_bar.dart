import 'package:flutter/material.dart';

class TmdbSearchBar extends StatelessWidget {
  const TmdbSearchBar(
      {super.key,
      required this.label,
      required this.onValueChanged,
      this.onCompleted,
      this.controller});

  final String label;
  final ValueChanged<String> onValueChanged;
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
        decoration: InputDecoration(
          labelText: 'Search',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
          prefixIcon: const Icon(Icons.search),
        ),
        textInputAction: TextInputAction.done,
      ),
    );
  }
}
