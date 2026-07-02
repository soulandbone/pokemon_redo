import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_redo/application/pokemon_detail/pokemon_detail_provider.dart';
import 'package:pokemon_redo/constants/app_colors.dart';
import 'package:pokemon_redo/domain/entities/basic_pokemon/basic_pokemon.dart';
import 'package:pokemon_redo/domain/entities/pokemon_details/pokemon_details.dart';
import 'package:pokemon_redo/helpers/capitalizer.dart';
import 'package:pokemon_redo/helpers/number_formatter.dart';
import 'package:pokemon_redo/helpers/string_to_icon_mapper.dart';

class PokemonTile extends ConsumerWidget {
  const PokemonTile({required this.pokemon, super.key});

  final BasicPokemon pokemon;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final details = ref.watch(pokemonDetailProvider(pokemon.url));

    return details.when(
      data: (data) => _fullPokemonTile(data, pokemon),
      error: (e, _) => Center(child: Text("there was an error $e")),
      loading: () => Center(child: CircularProgressIndicator()),
    );
  }
}

Widget _fullPokemonTile(PokemonDetails details, BasicPokemon pokemon) {
  return GestureDetector(
    onTap: () {
      // Navigator.of(context).push(MaterialPageRoute(
      //     builder: (context) => PokemonInformation(
      //           pokemonInfo: pokemon,
      //         )));
    },
    child: Container(
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(12),
      ),
      margin: EdgeInsets.only(bottom: 10, left: 20, right: 20),
      height: 102,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'N°${numberFormatter(pokemon.id.toString())} ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      overflow: TextOverflow.ellipsis,
                      capitalizer(pokemon.name),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      height: 20,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: mapStringToIcons((details.types)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.orange, //AppMaps.typeColorMap[pokemon.types[0]],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Stack(
                children: [
                  // Center(
                  //   child: ImageGradient(
                  //     AppMaps.imageStringUrl[pokemon.types[0]]!,
                  //   ),
                  // ), //AppMaps.typeIconMapLarge[pokemon.types[0]]!
                  // Center(
                  //     child: Image.network(
                  //   pokemon.spriteUrl,
                  //   errorBuilder: (context, error, stackTrace) {
                  //     return Opacity(
                  //         opacity: 0.2,
                  //         child: Image.asset('assets/poke_ball_icon.png'));
                  //   },
                  // )),
                  Positioned(
                    right: 8,
                    top: 10,
                    child: GestureDetector(
                      onTap: () {
                        // ref
                        //     .read(favoritesProvider.notifier)
                        //     .toggle(pokemon.id);
                      },
                      child: CircleAvatar(
                        radius: 18,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 16, // Adjust the radius as needed
                          backgroundColor: AppColors
                              .kLikeCircleBackground, // Background color of the circle
                          // child: Icon(
                          //   size: 20,
                          //   isFav
                          //       ? Icons.favorite
                          //       : Icons.favorite_border_outlined,
                          //   color: isFav ? Colors.red : Colors.white,
                          // ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
