import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_redo/data/repositories/repositories_providers.dart';
import 'package:pokemon_redo/domain/entities/pokemon_species/pokemon_species.dart';

final pokemonSpeciesProvider = FutureProvider.autoDispose
    .family<PokemonSpecies, String>((ref, String id) async {
      final repository = ref.read(pokemonRepositoryProvider);

      ref.keepAlive();

      return repository.getPokemonSpeciesInfo(id);
    });
