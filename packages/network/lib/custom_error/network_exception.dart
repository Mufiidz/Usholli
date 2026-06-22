import 'package:core/core.dart';

class NetworkException extends BaseException {
  final int? code;
  NetworkException(super.message, [this.code]);

  @override
  String toString() => 'NetworkException($code): $message';
}
