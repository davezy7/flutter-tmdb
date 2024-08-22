import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tmdb/presentation/theme/tmdb_colors.dart';

abstract final class TmdbTheme {
  static final ColorScheme colorScheme = ColorScheme.fromSeed(
    seedColor: TmdbColors.cerulean,
    primary: TmdbColors.cerulean,
    onPrimary: TmdbColors.white,
    secondary: TmdbColors.charcoal,
    onSecondary: TmdbColors.white,
    surface: TmdbColors.charcoal,
    onSurface: TmdbColors.white,
    brightness: Brightness.dark,
  );

  static final AppBarTheme appBarTheme = AppBarTheme(
    elevation: 0.0,
    centerTitle: true,
    color: colorScheme.surface,
    titleTextStyle: TextStyle(
      color: colorScheme.onSurface,
      fontSize: 20.0,
      fontWeight: FontWeight.normal,
    ),
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
    ),
  );

  static const OutlineInputBorder noBorder = OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.all(Radius.circular(50)),
  );

  static InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    fillColor: TmdbColors.gray.withOpacity(0.1),
    filled: true,
    hintStyle: TextStyle(color: TmdbColors.gray.withOpacity(0.4)),
    floatingLabelBehavior: FloatingLabelBehavior.auto,
    border: noBorder,
    enabledBorder: noBorder,
    focusedBorder: noBorder,
  );

  static TabBarTheme tabBarTheme = TabBarTheme(
    indicatorSize: TabBarIndicatorSize.tab,
    indicatorColor: colorScheme.primary,
    dividerColor: Colors.transparent,
    labelColor: colorScheme.onSurface,
    labelPadding: const EdgeInsets.only(bottom: 8)
  );

  static final ThemeData theme = ThemeData(
      colorScheme: colorScheme,
      canvasColor: colorScheme.surface,
      scaffoldBackgroundColor: colorScheme.surface,
      appBarTheme: appBarTheme,
      inputDecorationTheme: inputDecorationTheme,
      tabBarTheme: tabBarTheme,
      useMaterial3: true);
}
