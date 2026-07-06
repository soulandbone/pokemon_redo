class PokemonDamages {
  PokemonDamages({
    required this.doubleDamageFrom,
    required this.halfDamageFrom,
    required this.noDamageFrom,
  });

  final List<String> doubleDamageFrom;
  final List<String> halfDamageFrom;
  final List<String> noDamageFrom;

  factory PokemonDamages.fromJson(Map<String, dynamic> json) {
    final doubleDamageFrom =
        json['damage_relations']['double_damage_from'] as List<dynamic>;
    final halfDamageFrom =
        json['damage_relations']['half_damage_from'] as List<dynamic>;
    final noDamageFrom =
        json['damage_relations']['no_damage_from'] as List<dynamic>;

    final listDoubleDamageFrom = doubleDamageFrom
        .map((e) => e['name'] as String)
        .toList();

    final listHalfDamageFrom = halfDamageFrom
        .map((e) => e['name'] as String)
        .toList();

    final listNoDamageFrom = noDamageFrom
        .map((e) => e['name'] as String)
        .toList();

    return PokemonDamages(
      doubleDamageFrom: listDoubleDamageFrom,
      halfDamageFrom: listHalfDamageFrom,
      noDamageFrom: listNoDamageFrom,
    );
  }
}
