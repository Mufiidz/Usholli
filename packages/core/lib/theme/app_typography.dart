import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core.dart';

class AppTypography {
  final TextStyle displayHero;
  final TextStyle pageTitle;
  final TextStyle sectionTitle;
  final TextStyle cardTitle;
  final TextStyle bodyPrimary;
  final TextStyle bodySecondary;
  final TextStyle caption;
  final TextStyle button;

  AppTypography._({
    required this.displayHero,
    required this.pageTitle,
    required this.sectionTitle,
    required this.cardTitle,
    required this.bodyPrimary,
    required this.bodySecondary,
    required this.caption,
    required this.button,
  });

  static TextTheme createTextTheme(
    BuildContext context,
    String bodyFontString,
    String displayFontString,
  ) {
    AppLogger.d(AppTypography, 'Init: $displayFontString, $bodyFontString');
    TextTheme baseTextTheme = context.textTheme;
    TextTheme bodyTextTheme = GoogleFonts.getTextTheme(bodyFontString, baseTextTheme);
    TextTheme displayTextTheme = GoogleFonts.getTextTheme(displayFontString, baseTextTheme);
    TextTheme textTheme = displayTextTheme.copyWith(
      // Headline & Display menggunakan displayFontString (Noto Serif)
      displayLarge: displayTextTheme.displayLarge?.copyWith(
        fontSize: 57,
        height: 1.12,
        letterSpacing: -0.25,
      ),
      headlineLarge: displayTextTheme.headlineLarge?.copyWith(fontSize: 32, height: 1.25),
      headlineSmall: displayTextTheme.headlineSmall?.copyWith(fontSize: 24, height: 1.33),

      // Title, Body, Label menggunakan bodyFontString (Plus Jakarta Sans)
      titleMedium: bodyTextTheme.titleMedium?.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        height: 1.5,
        letterSpacing: 0.15,
      ),
      bodyLarge: bodyTextTheme.bodyLarge?.copyWith(fontSize: 16, height: 1.5, letterSpacing: 0.5),
      bodyMedium: bodyTextTheme.bodyMedium?.copyWith(
        fontSize: 14,
        height: 1.43,
        letterSpacing: 0.25,
      ),
      labelSmall: bodyTextTheme.labelSmall?.copyWith(
        fontSize: 11,
        height: 1.45,
        letterSpacing: 0.5,
      ),
      labelLarge: bodyTextTheme.labelLarge?.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        height: 1.43,
        letterSpacing: 0.1,
      ),
    );
    return textTheme;
  }

  factory AppTypography.of(BuildContext context) {
    final textTheme = context.textTheme;
    return AppTypography._(
      displayHero: textTheme.displayLarge.orDefault(),
      pageTitle: textTheme.headlineLarge.orDefault(),
      sectionTitle: textTheme.titleMedium.orDefault(),
      cardTitle: textTheme.labelLarge.orDefault(),
      bodyPrimary: textTheme.bodyLarge.orDefault(),
      bodySecondary: textTheme.bodyMedium.orDefault(),
      caption: textTheme.labelSmall.orDefault(),
      button: textTheme.labelLarge.orDefault(),
    );
  }
}

extension TextStyleExt on TextStyle? {
  TextStyle orDefault() => this ?? const TextStyle();
}

TextTheme createTextTheme(BuildContext context, String bodyFontString, String displayFontString) {
  TextTheme baseTextTheme = context.textTheme;
  TextTheme bodyTextTheme = GoogleFonts.getTextTheme(bodyFontString, baseTextTheme);
  TextTheme displayTextTheme = GoogleFonts.getTextTheme(displayFontString, baseTextTheme);
  TextTheme textTheme = displayTextTheme.copyWith(
    bodyLarge: bodyTextTheme.bodyLarge,
    bodyMedium: bodyTextTheme.bodyMedium,
    bodySmall: bodyTextTheme.bodySmall,
    labelLarge: bodyTextTheme.labelLarge,
    labelMedium: bodyTextTheme.labelMedium,
    labelSmall: bodyTextTheme.labelSmall,
  );
  return textTheme;
}
