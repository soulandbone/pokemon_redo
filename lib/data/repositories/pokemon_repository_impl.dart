import 'dart:async';
import 'dart:convert';

import 'package:pokemon_redo/data/datasources/basic_pokemon_api_client.dart';
import 'package:pokemon_redo/data/datasources/pokemon_damages_api_client.dart';
import 'package:pokemon_redo/data/datasources/pokemon_details_api_client.dart';
import 'package:pokemon_redo/data/datasources/pokemon_species_api_client.dart';
import 'package:pokemon_redo/domain/entities/pokemon_details/pokemon_details.dart';
import 'package:pokemon_redo/domain/entities/pokemon_species/pokemon_species.dart';
import 'package:pokemon_redo/domain/pokemon_repository.dart';
import 'package:pokemon_redo/domain/entities/basic_pokemon/basic_pokemon.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  PokemonRepositoryImpl({
    required this.basicPokemonApiClient,
    required this.pokemonDetailsApiClient,
    required this.pokemonSpeciesApiClient,
    required this.pokemonDamagesApiClient,
  });

  final BasicPokemonApiClient basicPokemonApiClient;
  final PokemonDetailsApiClient pokemonDetailsApiClient;
  final PokemonSpeciesApiClient pokemonSpeciesApiClient;
  final PokemonDamagesApiClient pokemonDamagesApiClient;

  @override
  Future<List<BasicPokemon>> getBasicPokemons(int offset, int limit) async {
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
  Future<PokemonDetails> getPokemonDetails(String url) async {
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

  @override
  Future<PokemonSpecies> getPokemonSpeciesInfo(String id) async {
    Map<String, dynamic> decodedJson = {};

    try {
      final response = await pokemonSpeciesApiClient.fetchPokemonSpeciesInfo(
        id,
      );

      final data = response.body;
      decodedJson = jsonDecode(data);
    } catch (e) {
      print(e.toString());
    }

    return PokemonSpecies.fromJson(decodedJson);
  }

  @override
  Future<PokemonSpecies> getPokemonDamagesInfo(String type) async {
    Map<String, dynamic> decodedJson = {};

    try {
      final response = await pokemonDamagesApiClient.fetchPokemonDamagesInfo(
        type,
      );

      final data = response.body;
      decodedJson = jsonDecode(data);
    } catch (e) {
      print(e.toString());
    }

    return PokemonSpecies.fromJson(decodedJson);
  }
}
