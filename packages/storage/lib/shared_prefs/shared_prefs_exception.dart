import 'package:core/core.dart';

class SharedPrefsException extends BaseException {
  SharedPrefsException(super.message);

  @override
  String toString() => 'SharedPrefsException: $message';
}
