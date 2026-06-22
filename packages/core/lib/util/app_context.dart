import 'package:flutter/material.dart';

import '../theme/themes.dart';
import '../widgets/snackbar_widget.dart';

extension ContextExt on BuildContext {
  ThemeData get theme => Theme.of(this);
  ColorScheme get colorScheme => theme.colorScheme;
  TextTheme get textTheme => theme.textTheme;
  Size get mediaSize => MediaQuery.sizeOf(this);
  ScaffoldMessengerState get snackbar => ScaffoldMessenger.of(this);
  AppTheme get materialTheme => AppTheme(this);
  double get heightWithToolbar => mediaSize.height - kToolbarHeight;
  TextTheme get appTextTheme => AppTypography.createTextTheme(this, 'Plus Jakarta Sans', 'Noto Serif');
  AppTypography get typography => AppTypography.of(this);
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackbar(
    String message, {
    SnackbarState state = .normal,
  }) => snackbar.showSnackBar(SnackbarWidget(message, this, state: state));
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackbarError(
    String message, {
    SnackBarAction? action,
  }) => snackbar.showSnackBar(SnackbarWidget.error(this, message, action: action));
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackbarSucces(
    String message, {
    SnackBarAction? action,
  }) => snackbar.showSnackBar(SnackbarWidget.success(this, message, action: action));
}
