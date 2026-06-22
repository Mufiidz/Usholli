import 'package:logger/logger.dart';

// Logger get logger => Logger();

class AppLogger {
  static final Logger _logger = Logger(
    printer: PrettyPrinter(
      colors: true, // Mengaktifkan warna di konsol
      printEmojis: true, // Kita pakai emoji manual agar lebih konsisten
    ),
  );

  static void i(Object sender, String message) => _logger.i('${sender.runtimeType}: $message');
  static void d(Object sender, dynamic message) {
    final tag = sender is String ? sender : '${sender.runtimeType}';
    _logger.d('$tag: $message');
  }

  static void w(Object sender, String message) => _logger.w('${sender.runtimeType}: $message');
  static void e({
    required Object sender,
    required Object reason,
    String? extraInfo,
    String? message,
  }) {
    final buffer = StringBuffer()..writeln('${sender.runtimeType}');
    if (message != null) {
      buffer.writeln('Message: $message');
    }
    if (extraInfo != null) {
      buffer.writeln('Extra Info: $extraInfo');
    }
    buffer.writeln('Reason: $reason');
    _logger.e(buffer.toString());
  }
}
