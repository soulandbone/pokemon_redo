import 'dart:async';
import 'dart:convert';

import 'package:pokemon_redo/data/datasources/basic_pokemon_api_client.dart';
import 'package:pokemon_redo/domain/basic_pokemon_repository.dart';
import 'package:pokemon_redo/domain/entities/basic_pokemon/basic_pokemon.dart';

class BasicPokemonRepositoryImpl implements BasicPokemonRepository {
  BasicPokemonRepositoryImpl(this.basicPokemonApiClient);

  final BasicPokemonApiClient basicPokemonApiClient;

  @override
  Future<List<BasicPokemon>> fetchBasicPokemons(int offset, int limit) async {
    print("The repository implementation is working");

    List results = [];
    try {
      final response = await basicPokemonApiClient.fetchBasicPokemonData(
        offset: offset,
        limit: limit,
      );

      final data = response.body;
      final decodedJson = jsonDecode(data) as Map<String, dynamic>;

      results = decodedJson['results'] as List<dynamic>;
    } catch (e) {
      print(e.toString());
    }

    return results.map((e) {
      final element = e as Map<String, dynamic>;
      return BasicPokemon.fromJson(element);
    }).toList();
  }
}
