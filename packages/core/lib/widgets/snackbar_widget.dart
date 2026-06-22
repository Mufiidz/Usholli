import 'package:flutter/material.dart';

import '../util/app_context.dart';
import '../util/theme_ext.dart';

class SnackbarWidget extends SnackBar {
  final SnackbarState state;
  final String message;
  final Color? textColor;
  final BuildContext context;
  SnackbarWidget(
    this.message,
    this.context, {
    super.key,
    this.state = SnackbarState.normal,
    this.textColor,
    super.action,
    super.dismissDirection,
    super.duration,
    super.behavior = SnackBarBehavior.floating,
  }) : super(
         content: Text(message, style: TextStyle(color: textColor)),
         backgroundColor: getBackgroundColor(state, context),
       );

  static SnackbarWidget error(BuildContext context, String message, {SnackBarAction? action}) =>
      SnackbarWidget(message, context, state: .error, action: action);

  static SnackbarWidget success(BuildContext context, String message, {SnackBarAction? action}) =>
      SnackbarWidget(message, context, state: .success, action: action);

  static Color? getBackgroundColor(SnackbarState state, BuildContext context) {
    return switch (state) {
      SnackbarState.success => context.theme.isDark ? Colors.green[300] : Colors.green[700],
      SnackbarState.error => context.colorScheme.error,
      _ => null,
    };
  }
}

enum SnackbarState { normal, success, error }
