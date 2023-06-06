import 'dart:math';

extension UiExtensions on num? {
  String toInputFieldString(){
    if (this == null) return "";
    return toString();
  }
}

extension DoubleNullExtension on double? {
  roundTo(int digits){
    if (this == null) return null;
    num mod = pow(10.0, digits);
    return ((this! * mod).round().toDouble() / mod);
  }
}

extension DoubleExtension on double {
  roundTo(int digits){
    num mod = pow(10.0, digits);
    return ((this * mod).round().toDouble() / mod);
  }
}