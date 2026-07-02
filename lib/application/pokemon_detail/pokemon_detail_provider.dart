import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_redo/data/repositories/repositories_providers.dart';
import 'package:pokemon_redo/domain/entities/pokemon_details/pokemon_details.dart';

final pokemonDetailProvider = FutureProvider.autoDispose
    .family<PokemonDetails, String>((ref, String url) async {
      final repository = ref.read(pokemonRepositoryProvider);

      ref.keepAlive();

      return repository.fetchPokemonDetails(url);
    });
