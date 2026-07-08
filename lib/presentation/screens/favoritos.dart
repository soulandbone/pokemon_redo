import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_redo/application/basic_pokemon_list/basic_pokemon_list_provider.dart';
import 'package:pokemon_redo/presentation/widgets/pokemon_tile.dart';

class Favoritos extends ConsumerWidget {
  const Favoritos({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var favoritePokemonListState = ref.watch(basicPokemonListNotifierProvider);

    var savedList = favoritePokemonListState.basicPokemonList;

    print(
      "Favorite pokemon set is ${favoritePokemonListState.favoritePokemonSet}",
    );

    var newList = savedList
        .where(
          (element) =>
              favoritePokemonListState.favoritePokemonSet.contains(element.id),
        )
        .toList();

    print("saved list length is ${savedList.length}");

    return ListView.builder(
      itemCount: newList.length,
      itemBuilder: (context, index) {
        return PokemonTile(pokemon: newList[index]);
      },
    );
  }
}
