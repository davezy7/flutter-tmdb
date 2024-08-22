import 'package:flutter/material.dart';
import 'package:tmdb/presentation/screens/dashboard/dashboard_screen.dart';
import 'package:tmdb/presentation/theme/tmdb_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.dark,
      theme: TmdbTheme.theme,
      home: const DashboardScreen(),
    );
  }
}
