import 'package:flutter/material.dart';

class TmdbToggleTab extends StatefulWidget {
  final List<ToggleTabItemModel> children;
  final TabController? controller;

  const TmdbToggleTab({super.key, required this.children, this.controller});

  @override
  State<TmdbToggleTab> createState() => _TmdbToggleTabState();
}

class _TmdbToggleTabState extends State<TmdbToggleTab>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = widget.controller ??
        TabController(length: widget.children.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          indicatorColor: Colors.cyan,
          controller: _tabController,
          dividerColor: Colors.transparent,
          tabs: widget.children
              .map((item) => Padding(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, bottom: 8),
                    child: Text(
                      item.title,
                      maxLines: 1,
                      style: const TextStyle(fontSize: 16, color: Colors.cyan),
                    ),
                  ))
              .toList(),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: widget.children.map((item) => item.child).toList(),
          ),
        )
      ],
    );
  }
}

class ToggleTabItemModel {
  final String title;
  final Widget child;
  ToggleTabItemModel({required this.title, required this.child});
}
