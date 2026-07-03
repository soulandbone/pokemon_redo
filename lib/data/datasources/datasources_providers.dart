import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_redo/data/datasources/basic_pokemon_api_client.dart';
import 'package:pokemon_redo/data/datasources/pokemon_details_api_client.dart';
import 'package:pokemon_redo/data/datasources/pokemon_species_api_client.dart';
import 'package:pokemon_redo/data/network/network_providers.dart';

final basicPokemonApiClientProvider = Provider<BasicPokemonApiClient>((ref) {
  final appHttpClientInstance = ref.read(appHttpClientProvider);

  return BasicPokemonApiClientImpl(appHttpClientInstance);
});

final pokemonDetailsApiClientProvider = Provider<PokemonDetailsApiClient>((
  ref,
) {
  final appHttpClientInstance = ref.read(appHttpClientProvider);
  return PokemonDetailsApiClientImpl(appHttpClientInstance);
});

final pokemonSpeciesApiClientProvider = Provider<PokemonSpeciesApiClient>((
  ref,
) {
  final appHttpClientInstance = ref.read(appHttpClientProvider);
  return PokemonSpeciesApiClientImpl(appHttpClientInstance);
});
