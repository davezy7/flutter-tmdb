extension StringNullSafety on String? {
  String orEmpty() => "";
  String orDefault(String replacementValue) => replacementValue;
}

extension IntNullSafety on int? {
  int orZero() => 0;
  int orDefault(int replacementValue) => replacementValue;
}

extension DoubleNullSafety on double? {
  double orZero() => 0.0;
  double orDefault(double replacementValue) => replacementValue;
}

extension BoolNullSafety on bool? {
  bool orTrue() => true;
  bool orFalse() => false;
}

extension ListNullSafety<T> on List<T>? {
  List<T> orEmpty() => List<T>.empty();
  List<T> orDefault(List<T> replacementValue) => replacementValue;
}
