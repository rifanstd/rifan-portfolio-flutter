import 'dart:math';

class StringUtils {
  StringUtils._();

  static String getRandomUID() {
    return DateTime.now().toUtc().millisecondsSinceEpoch.toString() +
        getRandomString(5);
  }

  static String getRandomString(int length) {
    const chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    Random rnd = Random();

    return String.fromCharCodes(Iterable.generate(
        length, (_) => chars.codeUnitAt(rnd.nextInt(chars.length))));
  }
}
