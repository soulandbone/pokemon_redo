import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_redo/application/basic_pokemon_list/basic_pokemon_list_state.dart';

import 'package:pokemon_redo/data/repositories/repositories_providers.dart';
import 'package:pokemon_redo/domain/pokemon_repository.dart';

class BasicPokemonListNotifier extends Notifier<BasicPokemonListState> {
  late final PokemonRepository _repository;

  @override
  BasicPokemonListState build() {
    _repository = ref.read(pokemonRepositoryProvider);

    ref.keepAlive();

    return BasicPokemonListState(
      basicPokemonList: [],
      favoritePokemonSet: {},
      isLoading: false,
      isLoadingMore: false,
      initLoadDone: false,
      offset: 0,
      limit: 20,
      stringQuery: '',
    );
  }

  Future<void> loadBasicPokemons(int offset, int limit) async {
    try {
      state = state.copyWith(isLoading: true);
      final pokemonList = await _repository.getBasicPokemons(offset, limit);

      state = state.copyWith(
        isLoading: false,
        initLoadDone: true,
        basicPokemonList: pokemonList,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: "There was a problem loading the pokemons",
      );
    }
  }

  void toggleFavoritePokemon(int pokemonId) {
    var isFavorited = state.favoritePokemonSet.contains(pokemonId);
    if (isFavorited) {
      var newSet = state.favoritePokemonSet
          .where((element) => element != pokemonId)
          .toSet();
      var newState = state.copyWith(favoritePokemonSet: newSet);
      state = newState;
    } else {
      var newSet = {...state.favoritePokemonSet, pokemonId};
      var newState = state.copyWith(favoritePokemonSet: newSet);
      state = newState;
    }
  }
}
