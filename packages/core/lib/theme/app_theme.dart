import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../util/app_context.dart';

class AppTheme {
  final BuildContext context;

  const AppTheme(this.context);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff256a4b),
      surfaceTint: Color(0xff256a4b),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffabf2c9),
      onPrimaryContainer: Color(0xff005234),
      secondary: Color(0xff4f6628),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffd1eca0),
      onSecondaryContainer: Color(0xff384d12),
      tertiary: Color(0xff37693d),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffb8f0b8),
      onTertiaryContainer: Color(0xff1e5027),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfff8faf0),
      onSurface: Color(0xff191d17),
      onSurfaceVariant: Color(0xff404943),
      outline: Color(0xff707972),
      outlineVariant: Color(0xffc0c9c1),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2e322b),
      inversePrimary: Color(0xff90d5ae),
      primaryFixed: Color(0xffabf2c9),
      onPrimaryFixed: Color(0xff002112),
      primaryFixedDim: Color(0xff90d5ae),
      onPrimaryFixedVariant: Color(0xff005234),
      secondaryFixed: Color(0xffd1eca0),
      onSecondaryFixed: Color(0xff131f00),
      secondaryFixedDim: Color(0xffb5d086),
      onSecondaryFixedVariant: Color(0xff384d12),
      tertiaryFixed: Color(0xffb8f0b8),
      onTertiaryFixed: Color(0xff002107),
      tertiaryFixedDim: Color(0xff9dd49e),
      onTertiaryFixedVariant: Color(0xff1e5027),
      surfaceDim: Color(0xffd8dbd1),
      surfaceBright: Color(0xfff8faf0),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff2f5eb),
      surfaceContainer: Color(0xffecefe5),
      surfaceContainerHigh: Color(0xffe7e9df),
      surfaceContainerHighest: Color(0xffe1e4da),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff003f27),
      surfaceTint: Color(0xff256a4b),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff367958),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff283c02),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff5d7536),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff0a3f18),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff46784a),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff740006),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffcf2c27),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff8faf0),
      onSurface: Color(0xff0f120d),
      onSurfaceVariant: Color(0xff303832),
      outline: Color(0xff4c554e),
      outlineVariant: Color(0xff666f68),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2e322b),
      inversePrimary: Color(0xff90d5ae),
      primaryFixed: Color(0xff367958),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff186041),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff5d7536),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff465c1f),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff46784a),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff2d5f34),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffc5c8be),
      surfaceBright: Color(0xfff8faf0),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff2f5eb),
      surfaceContainer: Color(0xffe7e9df),
      surfaceContainerHigh: Color(0xffdbded4),
      surfaceContainerHighest: Color(0xffd0d3c9),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff00341f),
      surfaceTint: Color(0xff256a4b),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff045436),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff203100),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff3b5015),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff003410),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff215329),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff600004),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff98000a),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff8faf0),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff262e29),
      outlineVariant: Color(0xff434b45),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2e322b),
      inversePrimary: Color(0xff90d5ae),
      primaryFixed: Color(0xff045436),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff003b24),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff3b5015),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff253800),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff215329),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff053b15),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffb7bab1),
      surfaceBright: Color(0xfff8faf0),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffeff2e8),
      surfaceContainer: Color(0xffe1e4da),
      surfaceContainerHigh: Color(0xffd3d6cc),
      surfaceContainerHighest: Color(0xffc5c8be),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff90d5ae),
      surfaceTint: Color(0xff90d5ae),
      onPrimary: Color(0xff003823),
      primaryContainer: Color(0xff005234),
      onPrimaryContainer: Color(0xffabf2c9),
      secondary: Color(0xffb5d086),
      onSecondary: Color(0xff233600),
      secondaryContainer: Color(0xff384d12),
      onSecondaryContainer: Color(0xffd1eca0),
      tertiary: Color(0xff9dd49e),
      onTertiary: Color(0xff023913),
      tertiaryContainer: Color(0xff1e5027),
      onTertiaryContainer: Color(0xffb8f0b8),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff11140f),
      onSurface: Color(0xffe1e4da),
      onSurfaceVariant: Color(0xffc0c9c1),
      outline: Color(0xff8a938c),
      outlineVariant: Color(0xff404943),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe1e4da),
      inversePrimary: Color(0xff256a4b),
      primaryFixed: Color(0xffabf2c9),
      onPrimaryFixed: Color(0xff002112),
      primaryFixedDim: Color(0xff90d5ae),
      onPrimaryFixedVariant: Color(0xff005234),
      secondaryFixed: Color(0xffd1eca0),
      onSecondaryFixed: Color(0xff131f00),
      secondaryFixedDim: Color(0xffb5d086),
      onSecondaryFixedVariant: Color(0xff384d12),
      tertiaryFixed: Color(0xffb8f0b8),
      onTertiaryFixed: Color(0xff002107),
      tertiaryFixedDim: Color(0xff9dd49e),
      onTertiaryFixedVariant: Color(0xff1e5027),
      surfaceDim: Color(0xff11140f),
      surfaceBright: Color(0xff373a33),
      surfaceContainerLowest: Color(0xff0c0f0a),
      surfaceContainerLow: Color(0xff191d17),
      surfaceContainer: Color(0xff1d211b),
      surfaceContainerHigh: Color(0xff272b25),
      surfaceContainerHighest: Color(0xff32362f),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffa5ecc3),
      surfaceTint: Color(0xff90d5ae),
      onPrimary: Color(0xff002c1a),
      primaryContainer: Color(0xff5b9e7b),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffcbe69a),
      onSecondary: Color(0xff1b2a00),
      secondaryContainer: Color(0xff809956),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffb2eab2),
      onTertiary: Color(0xff002d0c),
      tertiaryContainer: Color(0xff699d6b),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffd2cc),
      onError: Color(0xff540003),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff11140f),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffd6dfd6),
      outline: Color(0xffabb4ac),
      outlineVariant: Color(0xff8a938b),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe1e4da),
      inversePrimary: Color(0xff025335),
      primaryFixed: Color(0xffabf2c9),
      onPrimaryFixed: Color(0xff00150a),
      primaryFixedDim: Color(0xff90d5ae),
      onPrimaryFixedVariant: Color(0xff003f27),
      secondaryFixed: Color(0xffd1eca0),
      onSecondaryFixed: Color(0xff0a1400),
      secondaryFixedDim: Color(0xffb5d086),
      onSecondaryFixedVariant: Color(0xff283c02),
      tertiaryFixed: Color(0xffb8f0b8),
      onTertiaryFixed: Color(0xff001604),
      tertiaryFixedDim: Color(0xff9dd49e),
      onTertiaryFixedVariant: Color(0xff0a3f18),
      surfaceDim: Color(0xff11140f),
      surfaceBright: Color(0xff42463e),
      surfaceContainerLowest: Color(0xff050804),
      surfaceContainerLow: Color(0xff1b1f19),
      surfaceContainer: Color(0xff252923),
      surfaceContainerHigh: Color(0xff30342d),
      surfaceContainerHighest: Color(0xff3b3f38),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffbbffd7),
      surfaceTint: Color(0xff90d5ae),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xff8cd1ab),
      onPrimaryContainer: Color(0xff000e06),
      secondary: Color(0xffdefaac),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffb2cc83),
      onSecondaryContainer: Color(0xff060d00),
      tertiary: Color(0xffc5fec5),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xff99d09a),
      onTertiaryContainer: Color(0xff000f02),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea4),
      onErrorContainer: Color(0xff220001),
      surface: Color(0xff11140f),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xffe9f2ea),
      outlineVariant: Color(0xffbcc5bd),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe1e4da),
      inversePrimary: Color(0xff025335),
      primaryFixed: Color(0xffabf2c9),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xff90d5ae),
      onPrimaryFixedVariant: Color(0xff00150a),
      secondaryFixed: Color(0xffd1eca0),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffb5d086),
      onSecondaryFixedVariant: Color(0xff0a1400),
      tertiaryFixed: Color(0xffb8f0b8),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xff9dd49e),
      onTertiaryFixedVariant: Color(0xff001604),
      surfaceDim: Color(0xff11140f),
      surfaceBright: Color(0xff4e514a),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff1d211b),
      surfaceContainer: Color(0xff2e322b),
      surfaceContainerHigh: Color(0xff393d36),
      surfaceContainerHighest: Color(0xff444841),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
    useMaterial3: true,
    brightness: colorScheme.brightness,
    colorScheme: colorScheme,
    textTheme: context.appTextTheme.apply(bodyColor: colorScheme.onSurface, displayColor: colorScheme.onSurface),
    scaffoldBackgroundColor: colorScheme.surface,
    canvasColor: colorScheme.surface,
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
  );

  List<ExtendedColor> get extendedColors => [];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
