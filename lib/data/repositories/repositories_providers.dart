import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_redo/data/datasources/datasources_providers.dart';
import 'package:pokemon_redo/data/repositories/pokemon_repository_impl.dart';
import 'package:pokemon_redo/domain/pokemon_repository.dart';

final pokemonRepositoryProvider = Provider<PokemonRepository>((ref) {
  // needs to change to get both ApiClientInstances

  final basicPokemonApiClientInstance = ref.read(basicPokemonApiClientProvider);
  final pokemonDetailsApiClientInstance = ref.read(
    pokemonDetailsApiClientProvider,
  );
  final pokemonSpeciesApiClientInstance = ref.read(
    pokemonSpeciesApiClientProvider,
  );

  final pokemonDamagesApiClientInstance = ref.read(
    pokemonDamagesApiClientProvider,
  );

  return PokemonRepositoryImpl(
    basicPokemonApiClient: basicPokemonApiClientInstance,
    pokemonDetailsApiClient: pokemonDetailsApiClientInstance,
    pokemonSpeciesApiClient: pokemonSpeciesApiClientInstance,
    pokemonDamagesApiClient: pokemonDamagesApiClientInstance,
  );
});
