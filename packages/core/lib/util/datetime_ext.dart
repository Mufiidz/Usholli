import 'package:intl/intl.dart';

extension DateTimeExt on DateTime? {
  String get fullDate => customFormat('EEEE, d MMMM yyyy HH:mm:ss');
  String get shortDate => customFormat('d MMMM yyyy HH:mm');
  String get fullDateWithoutTime => customFormat('EEEE, d MMMM yyyy');
  String get fullDateWithoutDay => customFormat('d MMMM yyyy');
  String get timeOnly => customFormat('HH:mm:ss');
  String get shortTime => customFormat('HH:mm');
  String get toIsoDate => customFormat('yyyy-MM-dd');
  String customFormat(String format) {
    // final currentLangCode = getIt<LocaleService>().languageCode;
    final datetime = this;
    if (datetime == null) return '-';
    final localTime = datetime.isUtc ? datetime.toLocal() : datetime;
    return DateFormat(format).format(localTime);
  }
}
