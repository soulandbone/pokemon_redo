class PokemonDetails {
  PokemonDetails({
    required this.frontDefault,
    required this.weight,
    required this.height,
    required this.types,
    required this.abilities,
  });

  final String frontDefault;
  final int weight;
  final int height;
  final List<String> types;
  final List<dynamic> abilities;

  factory PokemonDetails.fromJson(Map<String, dynamic> json) {
    final weight = json['weight'] as int;
    final height = json['height'] as int;
    final frontDefault = json['sprites']['front_default'] as String? ?? '';
    final typesJson = json['types'] as List<dynamic>;
    final abilities = json['abilities'] as List<dynamic>;

    final types = typesJson
        .map(
          (typeItem) =>
              (typeItem as Map<String, dynamic>)['type']['name'] as String,
        )
        .toList();

    return PokemonDetails(
      frontDefault: frontDefault,
      weight: weight,
      height: height,
      types: types,
      abilities: abilities,
    );
  }
}
