import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_redo/data/datasources/datasources_providers.dart';
import 'package:pokemon_redo/data/repositories/basic_pokemon_repository_impl.dart';
import 'package:pokemon_redo/domain/basic_pokemon_repository.dart';

final basicPokemonRepositoryProvider = Provider<BasicPokemonRepository>((ref) {
  final basicPokemonApiClientInstance = ref.read(basicPokemonApiClientProvider);

  return BasicPokemonRepositoryImpl(basicPokemonApiClientInstance);
});
