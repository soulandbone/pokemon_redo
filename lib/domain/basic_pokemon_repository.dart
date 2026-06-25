import 'package:pokemon_redo/domain/entities/basic_pokemon/basic_pokemon.dart';

abstract class BasicPokemonRepository {
  Future<List<BasicPokemon>> fetchBasicPokemons();
}
