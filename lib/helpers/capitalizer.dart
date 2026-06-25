String capitalizer(String word) {
  var firstLetter = word.substring(0, 1).toUpperCase();
  var restOfWord = word.substring(1, word.length);

  return firstLetter + restOfWord;
}
