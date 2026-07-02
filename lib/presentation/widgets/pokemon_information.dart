import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokemon_redo/constants/app_maps.dart';
import 'package:pokemon_redo/constants/app_strings.dart';
import 'package:pokemon_redo/helpers/capitalizer.dart';
import 'package:pokemon_redo/helpers/category_converter.dart';
import 'package:pokemon_redo/helpers/description_formatter.dart';
import 'package:pokemon_redo/helpers/number_formatter.dart';
import 'package:pokemon_redo/helpers/string_to_icon_mapper.dart';
import 'package:pokemon_redo/presentation/screens/details_error.dart';
import 'package:pokemon_redo/presentation/widgets/colored_line.dart';
import 'package:pokemon_redo/presentation/widgets/custom_top_background.dart';
import 'package:pokemon_redo/presentation/widgets/image_gradient.dart';
import 'package:pokemon_redo/presentation/widgets/label_value.dart';
import 'package:pokemon_redo/presentation/widgets/weaknesses_grid.dart';

class PokemonInformation extends ConsumerWidget {
  const PokemonInformation({required this.pokemonInfo, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double marginHorizontal = 10;

    // final speciesInfoAsync = ref.watch(
    //   fetchPokemonSpeciesInfoProvider(pokemonInfo.id),
    // );
    // final typeInfoAsync = ref.watch(
    //   fetchPokemonTypeInfoProvider(pokemonInfo.types),
    // );

    return Scaffold(
      appBar: AppBar(title: Text(capitalizer(pokemonInfo.name))),
      body: speciesInfoAsync.when(
        data: (speciesInfoData) {
          return typeInfoAsync.when(
            data: (typeInfoData) {
              //   print('Type info Data is $typeInfoData');
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Stack(
                        children: [
                          SizedBox(
                            height: 350,
                            width: double.infinity,
                            child: CustomPaint(
                              painter: CustomTopBackground(
                                color:
                                    AppMaps.typeColorMap[pokemonInfo.types[0]],
                              ),
                            ),
                          ),
                          Center(
                            child: ImageGradient(
                              AppMaps.largeImageStringUrl[pokemonInfo
                                  .types[0]]!,
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Center(
                              child: SizedBox(
                                width: 300,
                                child: Image.network(
                                  fit: BoxFit.contain,
                                  pokemonInfo.spriteUrl,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 30,
                            top: 30,
                            child: GestureDetector(
                              onTap: () {
                                ref
                                    .read(favoritesProvider.notifier)
                                    .toggle(pokemonInfo.id);
                              },
                              child: Icon(
                                size: 40,
                                isFav
                                    ? Icons.favorite
                                    : Icons.favorite_border_outlined,
                                color: isFav ? Colors.red : Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: marginHorizontal,
                      ),
                      child: Text(
                        capitalizer(pokemonInfo.name),
                        style: GoogleFonts.poppins(
                          fontSize: 32,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: marginHorizontal,
                      ),
                      child: Text(
                        'N° ${numberFormatter(pokemonInfo.id)}',
                        style: TextStyle(fontSize: 22),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 30,
                      margin: EdgeInsets.symmetric(
                        horizontal: marginHorizontal,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: mapStringToIconsMedium(pokemonInfo.types),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        descriptionFormatter(speciesInfoData.description),
                        softWrap: true,
                      ),
                    ),
                    SizedBox(height: 20),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: LabelValue(
                            textLabel: AppStrings.kPeso.toUpperCase(),
                            icon: Icons.balance,
                            value: '${(pokemonInfo.weight / 10).toString()} KG',
                          ),
                        ),
                        Expanded(
                          child: LabelValue(
                            textLabel: AppStrings.kAltura.toUpperCase(),
                            icon: Icons.height,
                            value: '${pokemonInfo.height / 10} m',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: LabelValue(
                            textLabel: AppStrings.kCategoria.toUpperCase(),
                            icon: Icons.category_outlined,
                            value: categoryConverter(speciesInfoData.genus),
                          ),
                        ),
                        Expanded(
                          child: LabelValue(
                            textLabel: AppStrings.kHabilidad.toUpperCase(),
                            icon: Icons.catching_pokemon_outlined,
                            value: pokemonInfo.abilities[0],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Center(child: Text('GENERO')),
                    SizedBox(height: 30),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      child: ColoredLine(
                        backgroundColor: Colors.red,
                        fillColor: Colors.blue,
                        genderRate: speciesInfoData.genderRate,
                      ),
                    ),
                    SizedBox(height: 40),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'Debilidades',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    WeaknessesGrid(types: calculateWeaknesses(typeInfoData)),
                    SizedBox(height: 100),
                  ],
                ),
              );
            },
            error: (err, stack) => DetailsError(),
            loading: () => Center(child: CircularProgressIndicator()),
          );
        },
        loading: () => Center(child: CircularProgressIndicator()),
        error: (err, stack) => DetailsError(),
      ),
    );
  }
}
