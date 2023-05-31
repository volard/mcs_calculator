extension UiExtensions on num? {
  String toInputFieldString(){
    if (this == null) return "";
    return toString();
  }
}