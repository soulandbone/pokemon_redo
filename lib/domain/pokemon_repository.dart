import 'package:pokemon_redo/domain/entities/basic_pokemon/basic_pokemon.dart';
import 'package:pokemon_redo/domain/entities/pokemon_details/pokemon_details.dart';

abstract class PokemonRepository {
  Future<List<BasicPokemon>> fetchBasicPokemons(int offset, int limit);
  Future<PokemonDetails> fetchPokemonDetails(String url);
}
