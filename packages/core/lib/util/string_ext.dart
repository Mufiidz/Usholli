extension StringExt on String? {
  String orEmpty() => this ?? '';
  String orDash() => this ?? '-';
  bool isNullOrEmpty() {
    final value = this;
    return value == null || value.trim().isEmpty;
  }
}
