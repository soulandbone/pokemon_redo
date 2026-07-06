import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_redo/data/repositories/repositories_providers.dart';
import 'package:pokemon_redo/domain/entities/pokemon_damages/pokemon_damages.dart';

final pokemonDamagesProvider = FutureProvider.autoDispose
    .family<List<PokemonDamages>, List<String>>((
      ref,
      List<String> types,
    ) async {
      final repository = ref.read(pokemonRepositoryProvider);

      ref.keepAlive();

      return repository.getPokemonDamagesInfo(types);
    });
