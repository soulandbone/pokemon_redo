import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_redo/application/basic_pokemon_list/basic_pokemon_list_notifier.dart';
import 'package:pokemon_redo/application/basic_pokemon_list/basic_pokemon_list_provider.dart';
import 'package:pokemon_redo/application/basic_pokemon_list/basic_pokemon_list_state.dart';
import 'package:pokemon_redo/presentation/widgets/pokemon_tile.dart';

class Pokedex extends ConsumerStatefulWidget {
  const Pokedex({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PokedexState();
}

class _PokedexState extends ConsumerState<Pokedex> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(basicPokemonListNotifierProvider);

      if (!ref.read(basicPokemonListNotifierProvider).initLoadDone) {
        ref
            .read(basicPokemonListNotifierProvider.notifier)
            .loadBasicPokemons(
              ref.read(basicPokemonListNotifierProvider).offset,
              ref.read(basicPokemonListNotifierProvider).limit,
            );
      }
      _scrollController.addListener(_onScroll);
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      print(
        'Inside of _onScrol, offset is ${ref.read(basicPokemonListNotifierProvider).offset} and limit is ${ref.read(basicPokemonListNotifierProvider).limit}',
      );
      if (!ref.read(basicPokemonListNotifierProvider).isLoadingMore) {
        ref
            .read(basicPokemonListNotifierProvider.notifier)
            .loadMorePokemons(
              offset: ref.read(basicPokemonListNotifierProvider).offset,
              limit: ref.read(basicPokemonListNotifierProvider).limit,
            );

        var state = ref.read(basicPokemonListNotifierProvider);
        var newState = state.copyWith(isLoadingMore: false);
        state = newState;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(basicPokemonListNotifierProvider);
    final pokemons = state.basicPokemonList;

    print('Current pokemons are $pokemons');

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Pokedex App'),
          automaticallyImplyLeading: false,
          // actions: [
          //   IconButton(
          //     onPressed: () {
          //       // showModalBottomSheet(
          //       //     context: context,
          //       //     builder: (context) => FiltersModal());
          //     },
          //     icon: Icon(Icons.filter_alt),
          //   ),
          // ],
        ),
        body: state.isLoading
            ? Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: Row(
                      children: [
                        // Expanded(
                        //     child: SearchBoxPokemon(
                        //   controller: _textController,
                        // )),
                        SizedBox(width: 30),
                        // InkWell(
                        //   onTap: () {
                        //     // clearSearchBox();
                        //   }, // This is to clear what is in the controller
                        //   child: Container(
                        //     decoration: BoxDecoration(
                        //       shape: BoxShape.circle,
                        //       border: Border.all(color: Colors.grey, width: 1),
                        //     ),
                        //     child: CircleAvatar(
                        //       backgroundColor: Colors.white,
                        //       child: Icon(Icons.clear),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),

                  Expanded(
                    child: ListView.builder(
                      controller: _scrollController,
                      itemCount: pokemons.length,
                      itemBuilder: (_, index) {
                        return PokemonTile(pokemon: pokemons[index]);
                      },
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
