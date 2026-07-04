import 'package:pokemon_redo/domain/entities/pokemon_damages/pokemon_damages.dart';

List<String> calculateWeaknesses(List<PokemonDamages> pokemonDamageInfoList) {
  Set<String> doubleDamageFrom = {};
  Set<String> halfDamageFrom = {};
  Set<String> noDamageFrom = {};

  for (var pokemonDamageInfo in pokemonDamageInfoList) {
    List<String> doubleDamageFromList = pokemonDamageInfo.doubleDamageFrom;
    List<String> halfDamageFromList = pokemonDamageInfo.halfDamageFrom;
    List<String> noDamageFromList = pokemonDamageInfo.noDamageFrom;

    for (var type in doubleDamageFromList) {
      doubleDamageFrom.add(type);
    }
    for (var type in halfDamageFromList) {
      halfDamageFrom.add(type);
    }
    for (var type in noDamageFromList) {
      noDamageFrom.add(type);
    }
  }

  var resistances = {...halfDamageFrom, ...noDamageFrom};

  return doubleDamageFrom.difference(resistances).toList();
}
