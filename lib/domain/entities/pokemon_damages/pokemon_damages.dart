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
    final doubleDamageFrom = json['damage_relations']['double_damage_from'];
    final halfDamageFrom = json['damage_relations']['half_damage_from'];
    final noDamageFrom = json['damage_relations']['no_damage_from'];

    return PokemonDamages(
      doubleDamageFrom: doubleDamageFrom,
      halfDamageFrom: halfDamageFrom,
      noDamageFrom: noDamageFrom,
    );
  }
}
