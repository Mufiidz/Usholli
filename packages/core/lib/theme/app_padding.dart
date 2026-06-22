import 'package:flutter/material.dart';

import 'app_size.dart';

class AppPadding {
  AppPadding._();

  /// Padding XS (4) - EdgeInsets.all(4);
  static EdgeInsets get xs => EdgeInsets.all(AppSize.xs);

  /// Padding SM (8) - EdgeInsets.all(8);
  static EdgeInsets get sm => EdgeInsets.all(AppSize.sm);

  /// Padding MD (12) - EdgeInsets.all(12);
  static EdgeInsets get md => EdgeInsets.all(AppSize.md);

  /// Padding LG (16) - EdgeInsets.all(16);
  static EdgeInsets get lg => EdgeInsets.all(AppSize.lg);

  /// Padding XL (24) - EdgeInsets.all(24);
  static EdgeInsets get xl => EdgeInsets.all(AppSize.xl);

  /// Padding XXL (32) - EdgeInsets.all(32);
  static EdgeInsets get xxl => EdgeInsets.all(AppSize.xxl);

  /// Padding XXXL (40) - EdgeInsets.all(40);
  static EdgeInsets get xxxl => EdgeInsets.all(AppSize.xxxl);

  /// Padding Zero - EdgeInsets.all(0);
  static EdgeInsets get zero => const EdgeInsets.all(0);

  /// Padding Horizontal LG (16) - EdgeInsets.symmetric(horizontal: 16);
  static EdgeInsets get horizontalLg => EdgeInsets.symmetric(horizontal: AppSize.lg);

  /// Padding Vertical LG (16) - EdgeInsets.symmetric(vertical: 16);
  static EdgeInsets get verticalLg => EdgeInsets.symmetric(vertical: AppSize.lg);
}
