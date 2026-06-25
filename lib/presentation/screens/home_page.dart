import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_redo/constants/app_strings.dart';
import 'package:pokemon_redo/data/datasources/basic_pokemon_api_client.dart';
import 'package:pokemon_redo/data/network/app_http_client.dart';
import 'package:pokemon_redo/di.dart';
import 'package:pokemon_redo/presentation/screens/favoritos.dart';
import 'package:pokemon_redo/presentation/screens/perfil.dart';
import 'package:pokemon_redo/presentation/screens/pokedex.dart';
import 'package:pokemon_redo/presentation/screens/regiones.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final api = getIt<BasicPokemonApiClient>();

  int _selectedIndex = 0;

  void onSelection(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    getPokemons();
    super.initState();
  }

  Future<void> getPokemons() async {
    try {
      final results = await api.fetchBasicPokemonData(offset: 20, limit: 20);
      print('Results are ${jsonDecode(results.body)['results']}');
    } catch (e) {
      print(e.toString());
    }
  }

  List<Widget> screens = [Pokedex(), Regiones(), Favoritos(), Perfil()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        elevation: 12,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        currentIndex: _selectedIndex,
        onTap: onSelection,
        items: [
          BottomNavigationBarItem(
            label: AppStrings.kPokeDexTab,
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: AppStrings.kRegionesTab,
            icon: Icon(Icons.language),
          ),
          BottomNavigationBarItem(
            label: AppStrings.kFavoritosTab,
            icon: Icon(Icons.favorite),
          ),
          BottomNavigationBarItem(
            label: AppStrings.kPerfilTab,
            icon: Icon(Icons.person),
          ),
        ],
      ),
      body: screens[_selectedIndex],
    );
  }
}
