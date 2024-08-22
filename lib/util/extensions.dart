extension StringNullSafety on String? {
  String orEmpty() => this ?? "";
  String orDefault(String replacementValue) => this ?? replacementValue;
}

extension IntNullSafety on int? {
  int orZero() => this ?? 0;
  int orDefault(int replacementValue) => this ?? replacementValue;
}

extension DoubleNullSafety on double? {
  double orZero() => this ?? 0.0;
  double orDefault(double replacementValue) => this ?? replacementValue;
}

extension BoolNullSafety on bool? {
  bool orTrue() => this ?? true;
  bool orFalse() => this ?? false;
}

extension ListNullSafety<T> on List<T>? {
  List<T> orEmpty() => this ?? List<T>.empty();
  List<T> orDefault(List<T> replacementValue) => this ?? replacementValue;
}

extension DateTimeString on String {
  String getYear() => DateTime.parse(this).year.toString();
}
