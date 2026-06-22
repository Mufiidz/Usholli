import 'package:flutter/material.dart';

import '../util/app_context.dart';
import '../util/app_logger.dart';

class AppSize {
  AppSize._();

  static const double _base = 0.0;
  static const double _xs = 4.0;
  static const double _sm = 8.0;
  static const double _md = 12.0;
  static const double _lg = 16.0;
  static const double _xl = 24.0;
  static const double _xxl = 32.0;
  static const double _xxxl = 40.0;

  /// Size - 0
  static double zero = _base;

  /// Size - 4
  static double xs = _xs;

  /// Size - 8
  static double sm = _sm;

  /// Size - 12
  static double md = _md;

  /// Size - 16
  static double lg = _lg;

  /// Size - 24
  static double xl = _xl;

  /// Size - 32
  static double xxl = _xxl;

  /// Size - 40
  static double xxxl = _xxxl;

  static void init(BuildContext context) {
    double shortSide = context.mediaSize.shortestSide;

    // Angka 380 adalah standar basis ukuran HP (misal UI di Figma berbasis 380px)
    double scale = shortSide / 380.0;

    // Batasi agar tidak terlalu mengecil atau terlalu membesar
    scale = scale.clamp(0.85, 1.4);

    xs = _xs * scale;
    sm = _sm * scale;
    md = _md * scale;
    lg = _lg * scale;
    xl = _xl * scale;
    xxl = _xxl * scale;
    xxxl = _xxxl * scale;

    AppLogger.d(AppSize, 'Init: $xs, $sm, $md, $lg, $xl, $xxl, $xxxl');
  }
}
