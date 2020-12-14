abstract class Funktionen {
  static bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    s = s.replaceAll(',', '.');
    try {
      double parseDouble = double.parse(s);
    } catch (e) {
      return false;
    }
    return true;
  }
}
