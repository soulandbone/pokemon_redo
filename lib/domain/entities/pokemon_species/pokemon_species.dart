class PokemonSpecies {
  PokemonSpecies({
    required this.genderRate,
    required this.description,
    required this.genus,
  });

  final int genderRate;
  final String description;
  final String genus;

  factory PokemonSpecies.fromJson(Map<String, dynamic> json) {
    final genderRate = json['gender_rate'];
    final genera = json['genera']; //genus is inside of genera entry
    final flavorTexts = json['flavor_text_entries'];

    final genus =
        genera.firstWhere(
              (element) => element['language']['name'] == 'en',
            )['genus']
            as String;

    final description =
        flavorTexts.firstWhere(
              (element) => element['language']['name'] == 'en',
            )['flavor_text']
            as String;

    return PokemonSpecies(
      genderRate: genderRate,
      description: description,
      genus: genus,
    );
  }
}
