class PokemonDetails {
  PokemonDetails({
    required this.imageUrl,
    required this.weight,
    required this.height,
    required this.types,
    required this.abilities,
  });

  final String imageUrl;
  final int weight;
  final int height;
  final List<String> types;
  final List<String> abilities;

  factory PokemonDetails.fromJson(Map<String, dynamic> json) {
    final weight = json['weight'] as int;
    final height = json['height'] as int;
    final imageUrl = json['sprites']['front_default'] as String? ?? '';
    final typesJson = json['types'] as List<dynamic>;
    final abilitiesJson = json['abilities'] as List<dynamic>;

    final types = typesJson
        .map((typeItem) => typeItem['type']['name'] as String)
        .toList();

    final abilities = abilitiesJson
        .map((e) => e['ability']['name'] as String)
        .toList();

    return PokemonDetails(
      imageUrl: imageUrl,
      weight: weight,
      height: height,
      types: types,
      abilities: abilities,
    );
  }
}
