import 'dart:ui';

class Utils {
  static int _hash(String value) {
    int hash = 0;
    for (var code in value.runes) {
      hash = code + ((hash << 5) - hash);
    }
    return hash;
  }

  static Color stringToColor(String value) {
    String c = (_hash(value) & 0x00FFFFFF).toRadixString(16).toUpperCase();
    String hex = "FF00000".substring(0, 8 - c.length) + c;
    return Color(int.parse(hex, radix: 16));
  }
}
