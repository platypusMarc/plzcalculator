abstract class Funktionen {
  static bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    s = s.replaceAll(',', '.');
    try {
      // ignore: unused_local_variable
      double parseDouble = double.parse(s);
    } catch (e) {
      return false;
    }
    return true;
  }
}
