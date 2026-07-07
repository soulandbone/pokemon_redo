import 'package:pokemon_redo/domain/entities/basic_pokemon/basic_pokemon.dart';

class BasicPokemonListState {
  const BasicPokemonListState({
    required this.basicPokemonList,
    required this.favoritePokemonSet,
    required this.isLoading,
    required this.isLoadingMore,
    required this.hasMore,
    required this.offset,
    required this.limit,
    required this.stringQuery,
    this.errorMessage,
  });

  final List<BasicPokemon> basicPokemonList;
  final Set<int> favoritePokemonSet;
  final bool isLoading;
  final bool isLoadingMore;
  final bool hasMore;
  final int offset;
  final int limit;
  final String stringQuery;
  final String? errorMessage;

  BasicPokemonListState copyWith({
    List<BasicPokemon>? basicPokemonList,
    Set<int>? favoritePokemonSet,
    bool? isLoading,
    bool? isLoadingMore,
    bool? hasMore,
    int? offset,
    int? limit,
    String? stringQuery,
    String? errorMessage,
  }) {
    return BasicPokemonListState(
      basicPokemonList: basicPokemonList ?? this.basicPokemonList,
      favoritePokemonSet: favoritePokemonSet ?? this.favoritePokemonSet,
      isLoading: isLoading ?? this.isLoading,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      hasMore: hasMore ?? this.hasMore,
      offset: offset ?? this.offset,
      limit: limit ?? this.limit,
      stringQuery: stringQuery ?? this.stringQuery,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
