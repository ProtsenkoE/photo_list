class Helper {
  static String capitalize(String s) => s[0].toUpperCase() + s.substring(1);

  static validImage(String url) {
    return Uri.parse(url).isAbsolute;
  }
}
