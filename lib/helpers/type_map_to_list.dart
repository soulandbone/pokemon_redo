List<String> mapToList(List<dynamic> damageRelation) {
  return damageRelation.map((e) => e['name'] as String).toList();
}
