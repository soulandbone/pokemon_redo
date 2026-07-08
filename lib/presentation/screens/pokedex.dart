import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_redo/application/basic_pokemon_list/basic_pokemon_list_provider.dart';
import 'package:pokemon_redo/presentation/widgets/pokemon_tile.dart';

class Pokedex extends ConsumerStatefulWidget {
  const Pokedex({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PokedexState();
}

class _PokedexState extends ConsumerState<Pokedex> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!ref.read(basicPokemonListNotifierProvider).initLoadDone) {
        ref
            .read(basicPokemonListNotifierProvider.notifier)
            .loadBasicPokemons(0, 20);
      }
    });
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
