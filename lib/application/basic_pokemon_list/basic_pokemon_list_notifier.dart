import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_redo/application/basic_pokemon_list/basic_pokemon_list_state.dart';

import 'package:pokemon_redo/data/repositories/repositories_providers.dart';
import 'package:pokemon_redo/domain/basic_pokemon_repository.dart';

class BasicPokemonListNotifier extends Notifier<BasicPokemonListState> {
  late final BasicPokemonRepository _repository;

  @override
  BasicPokemonListState build() {
    _repository = ref.read(basicPokemonRepositoryProvider);

    return BasicPokemonListState(
      basicPokemonList: [],
      isLoading: false,
      isLoadingMore: false,
      hasMore: true,
      offset: 0,
      limit: 20,
      stringQuery: '',
    );
  }

  Future<void> loadBasicPokemons(int offset, int limit) async {
    try {
      state.copyWith(isLoading: true);

      final pokemonList = await _repository.fetchBasicPokemons(offset, limit);

      print(
        "PokemonList inside of LoadBasicPokemons is ${pokemonList[5].name}",
      );

      state = state.copyWith(basicPokemonList: pokemonList);
      print("state list of pokemons is ${state.basicPokemonList}");
    } catch (e) {
      state.copyWith(errorMessage: "There was a problem loading the pokemons");
    }
  }
}
