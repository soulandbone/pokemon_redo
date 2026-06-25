// helpers/filter_utils.dart
List<int> getActiveIndices(List<bool> filters) {
  return filters
      .asMap()
      .entries
      .where((entry) => entry.value)
      .map((entry) => entry.key)
      .toList();
}

List<String> getActiveTypes(List<int> activeIndices, List<String> allTypes) {
  return activeIndices.map((index) => allTypes[index]).toList();
}
