import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_redo/application/basic_pokemon_list/basic_pokemon_list_notifier.dart';
import 'package:pokemon_redo/application/basic_pokemon_list/basic_pokemon_list_state.dart';

final basicPokemonListNotifierProvider =
    NotifierProvider<BasicPokemonListNotifier, BasicPokemonListState>(
      BasicPokemonListNotifier.new,
    );
