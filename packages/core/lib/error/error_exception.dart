import '../core.dart';

class ErrorException extends BaseException {
  final Object? reason;
  ErrorException(super.message, {this.reason});

  @override
  String toString() =>
      reason != null ? 'ErrorException: $message | $reason' : 'ErrorException: $message';
}
