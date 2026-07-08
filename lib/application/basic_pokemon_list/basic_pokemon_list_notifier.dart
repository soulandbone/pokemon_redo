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

      var newState = state.copyWith(
        offset: offset += state.limit,
        isLoading: false,
        initLoadDone: true,
        basicPokemonList: pokemonList,
      );

      state = newState;
      print(
        'state now for offset is ${state.offset} and limit is ${state.limit}',
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: "There was a problem loading the pokemons",
      );
    }
  }

  Future<void> loadMorePokemons({
    required int offset,
    required int limit,
  }) async {
    try {
      state = state.copyWith(isLoadingMore: true);
      final newPokemonList = await _repository.getBasicPokemons(offset, limit);

      state = state.copyWith(
        basicPokemonList: [...state.basicPokemonList, ...newPokemonList],
        isLoadingMore: false,

        offset: offset += state.limit,
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
