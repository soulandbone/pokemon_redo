import 'dart:async';
import 'dart:convert';

import 'package:pokemon_redo/data/datasources/basic_pokemon_api_client.dart';
import 'package:pokemon_redo/data/datasources/pokemon_details_api_client.dart';
import 'package:pokemon_redo/domain/entities/pokemon_details/pokemon_details.dart';
import 'package:pokemon_redo/domain/pokemon_repository.dart';
import 'package:pokemon_redo/domain/entities/basic_pokemon/basic_pokemon.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  PokemonRepositoryImpl({
    required this.basicPokemonApiClient,
    required this.pokemonDetailsApiClient,
  });

  final BasicPokemonApiClient basicPokemonApiClient;
  final PokemonDetailsApiClient pokemonDetailsApiClient;

  @override
  Future<List<BasicPokemon>> fetchBasicPokemons(int offset, int limit) async {
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

  @override
  Future<PokemonDetails> fetchPokemonDetails(String url) async {
    Map<String, dynamic> decodedJson = {};

    try {
      final response = await pokemonDetailsApiClient.fetchPokemonDetails(url);

      final data = response.body;
      decodedJson = jsonDecode(data);
    } catch (e) {
      print(e.toString());
    }

    return PokemonDetails.fromJson(decodedJson);
  }
}
