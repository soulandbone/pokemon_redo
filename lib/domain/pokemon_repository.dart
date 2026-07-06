import 'package:pokemon_redo/domain/entities/basic_pokemon/basic_pokemon.dart';
import 'package:pokemon_redo/domain/entities/pokemon_damages/pokemon_damages.dart';
import 'package:pokemon_redo/domain/entities/pokemon_details/pokemon_details.dart';
import 'package:pokemon_redo/domain/entities/pokemon_species/pokemon_species.dart';

abstract class PokemonRepository {
  Future<List<BasicPokemon>> getBasicPokemons(int offset, int limit);
  Future<PokemonDetails> getPokemonDetails(String url);
  Future<PokemonSpecies> getPokemonSpeciesInfo(String id);
  Future<List<PokemonDamages>> getPokemonDamagesInfo(List<String> types);
}
