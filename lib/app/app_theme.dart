import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rick_and_morty/core/assets/fonts.dart';
import 'package:rick_and_morty/core/assets/pallete.dart';

class AppTheme {
  static const fadeInAnimationDuration = Duration(milliseconds: 200);
  static const cupertinoAnimationDuration = Duration(milliseconds: 350);
  static const fadeInAnimationDurationWithSafeDelay = Duration(milliseconds: 210);

  static ThemeData getLightTheme() {
    ColorScheme colorScheme = _getLightThemeColorScheme();

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: colorScheme.background,
      textButtonTheme: _getTextButtonThemeData(colorScheme),
      appBarTheme: _getAppBarTheme(colorScheme),
      textTheme: _getTextTheme(colorScheme),
    );
  }

  static ThemeData getDarkTheme() {
    ColorScheme colorScheme = _getDarkThemeColorScheme();

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: colorScheme.background,
      textButtonTheme: _getTextButtonThemeData(colorScheme),
      appBarTheme: _getAppBarTheme(colorScheme),
      textTheme: _getTextTheme(colorScheme),
    );
  }

  static TextButtonThemeData _getTextButtonThemeData(ColorScheme colorScheme) {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: colorScheme.secondary,
        disabledForegroundColor: colorScheme.onSurface.withOpacity(0.38),
        textStyle: _getTextTheme(colorScheme).labelLarge,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        minimumSize: const Size.fromHeight(48),
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  static AppBarTheme _getAppBarTheme(ColorScheme colorScheme) {
    return AppBarTheme(
      backgroundColor: Colors.transparent,
      foregroundColor: colorScheme.brightness == Brightness.dark ? Pallete.white : Pallete.black,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: colorScheme.brightness == Brightness.dark ? Brightness.light : Brightness.dark,
        statusBarBrightness: colorScheme.brightness,
      ),
      elevation: 0,
      scrolledUnderElevation: 0,
    );
  }

  static ColorScheme _getDarkThemeColorScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Pallete.black,
      onPrimary: Pallete.black,
      secondary: Pallete.white,
      onSecondary: Pallete.white,
      error: Pallete.undefined,
      onError: Pallete.undefined,
      background: Pallete.black,
      onBackground: Pallete.black,
      surface: Pallete.undefined,
      onSurface: Pallete.undefined,
    );
  }

  static ColorScheme _getLightThemeColorScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Pallete.white,
      onPrimary: Pallete.white,
      secondary: Pallete.black,
      onSecondary: Pallete.black,
      error: Pallete.red,
      onError: Pallete.red,
      background: Pallete.white,
      onBackground: Pallete.white,
      surface: Pallete.undefined,
      onSurface: Pallete.undefined,
    );
  }

  static TextTheme _getTextTheme(ColorScheme colorScheme) {
    final color = colorScheme.brightness == Brightness.dark ? Pallete.white : Pallete.black;

    return TextTheme(
      headlineLarge: TextStyle(
        fontSize: 32,
        fontFamily: Fonts.clashDisplay,
        fontWeight: FontWeight.w700,
        color: color,
      ),
      headlineSmall: TextStyle(
        fontSize: 22,
        fontFamily: Fonts.clashDisplay,
        fontWeight: FontWeight.w700,
        color: color,
      ),
      titleLarge: TextStyle(
        fontSize: 18,
        fontFamily: Fonts.clashDisplay,
        fontWeight: FontWeight.w700,
        color: color,
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        fontFamily: Fonts.clashDisplay,
        fontWeight: FontWeight.w400,
        color: color,
      ),
      bodySmall: const TextStyle(
        fontSize: 14,
        fontFamily: Fonts.clashDisplay,
        fontWeight: FontWeight.w400,
        color: Pallete.textBody,
      ),
      labelLarge: TextStyle(
        fontSize: 16,
        fontFamily: Fonts.clashDisplay,
        fontWeight: FontWeight.w600,
        color: color,
      ),
      labelSmall: TextStyle(
        fontSize: 11,
        fontFamily: Fonts.clashDisplay,
        fontWeight: FontWeight.w400,
        color: color,
      ),
    );
  }

  static TextStyle cupertinoNavigationBarTitleTextStyle(ColorScheme colorScheme) {
    return TextStyle(
      fontFamily: Fonts.clashDisplay,
      fontWeight: FontWeight.w600,
      color: colorScheme.brightness == Brightness.dark ? Pallete.white : Pallete.black,
    );
  }
}
