String categoryConverter(String originalString) {
  String result = originalString
      .replaceAll(RegExp(r'pokémon', caseSensitive: false), '')
      .trim();
  return result;
}
