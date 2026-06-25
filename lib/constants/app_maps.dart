import 'package:flutter/material.dart';
import 'package:pokemon_redo/constants/app_colors.dart';

double width = 20;
double height = 20;

double widthMedium = 80;
double heightMedium = 80;

BoxFit fitMedium = BoxFit.cover;
BoxFit fitSmall = BoxFit.fitWidth;

class AppMaps {
  static Map<String, Widget> typeIconMapSmall = {
    'grass': Image.asset('assets/small_icons/planta.png', fit: fitSmall),
    // example icon
    'bug': Image.asset('assets/small_icons/bicho.png', fit: fitSmall),
    'normal': Image.asset('assets/small_icons/normal.png', fit: fitSmall),
    'flying': Image.asset('assets/small_icons/volador.png', fit: fitSmall),
    'poison': Image.asset('assets/small_icons/veneno.png', fit: fitSmall),
    'fire': Image.asset('assets/small_icons/fuego.png', fit: fitSmall),
    'water': Image.asset('assets/small_icons/agua.png', fit: fitSmall),
    'electric': Image.asset('assets/small_icons/electrico.png', fit: fitSmall),
    'ground': Image.asset('assets/small_icons/tierra.png', fit: fitSmall),
    'fairy': Image.asset('assets/small_icons/hada.png', fit: fitSmall),
    'fighting': Image.asset('assets/small_icons/lucha.png', fit: fitSmall),
    'psychic': Image.asset('assets/small_icons/psiquico.png', fit: fitSmall),
    'rock': Image.asset('assets/small_icons/roca.png', fit: fitSmall),
    'steel': Image.asset('assets/small_icons/acero.png', fit: fitSmall),
    'ice': Image.asset('assets/small_icons/hielo.png', fit: fitSmall),
    'ghost': Image.asset('assets/small_icons/fantasma.png', fit: fitSmall),
    'dragon': Image.asset('assets/small_icons/dragon.png', fit: fitSmall),
    'dark': Image.asset('assets/small_icons/siniestro.png', fit: fitSmall),

    // more icons
  };

  static Map<String, Widget> typeIconMapLarge = {
    'grass': Image.asset(
      'assets/large_icons/grass.png',
      color: Colors.white.withAlpha(120),
    ),
    // example icon
    'bug': Image.asset('assets/large_icons/bug.png'),
    'normal': Image.asset('assets/large_icons/normal.png'),
    'flying': Image.asset('assets/large_icons/flying.png'),
    'poison': Image.asset('assets/large_icons/poison.png'),
    'fire': Image.asset('assets/large_icons/fire.png'),
    'water': Image.asset('assets/large_icons/water.png'),
    'electric': Image.asset('assets/large_icons/electric.png'),
    'ground': Image.asset('assets/large_icons/ground.png'),
    'fairy': Image.asset('assets/large_icons/fairy.png'),
    'fighting': Image.asset('assets/large_icons/fighting.png'),
    'psychic': Image.asset('assets/large_icons/psychic.png'),
    'rock': Image.asset('assets/large_icons/rock.png'),
    'steel': Image.asset('assets/large_icons/steel.png'),
    'ice': Image.asset('assets/large_icons/ice.png'),
    'ghost': Image.asset('assets/large_icons/ghost.png'),
    'dragon': Image.asset('assets/large_icons/dragon.png'),
    'dark': Image.asset('assets/large_icons/dark.png'),
  };

  static Map<String, Color> typeColorMap = {
    'grass': AppColors.kGrassSolid,
    'bug': AppColors.kBugSolid,
    'normal': AppColors.kGrassSolid,
    'flying': AppColors.kFlyingSolid,
    'poison': AppColors.kPoisonSolid,
    'fire': AppColors.kFireSolid,
    'water': AppColors.kWaterSolid,
    'electric': AppColors.kElectricSolid,
    'ground': AppColors.kElectricSolid,
    'fairy': AppColors.kFairySolid,
    'fighting': AppColors.kFightingSolid,
    'psychic': AppColors.kPsychicSolid,
    'rock': AppColors.kRockSolid,
    'steel': AppColors.kGrassSolid,
    'ice': AppColors.kIceSolid,
    'ghost': AppColors.kGhostSolid,
    'dragon': AppColors.kDragonSolid,
    'dark': AppColors.kGrassSolid,
  };

  static Map<String, Color> typeTransparentColorMap = {
    'grass': AppColors.kGrassTransparent,
    'bug': AppColors.kBugTransparent,
    'normal': AppColors.kGrassTransparent,
    'flying': AppColors.kFlyingTransparent,
    'poison': AppColors.kPoisonTransparent,
    'fire': AppColors.kFireTransparent,
    'water': AppColors.kWaterTransparent,
    'electric': AppColors.kElectricTransparent,
    'ground': AppColors.kElectricTransparent,
    'fairy': AppColors.kFairyTransparent,
    'fighting': AppColors.kFightingTransparent,
    'psychic': AppColors.kPsychicTransparent,
    'rock': AppColors.kRockTransparent,
    'steel': AppColors.kGrassTransparent,
    'ice': AppColors.kIceTransparent,
    'ghost': AppColors.kGhostTransparent,
    'dragon': AppColors.kDragonTransparent,
    'dark': AppColors.kGrassTransparent,
  };

  static Map<String, Widget> typeIconMapMedium = {
    'grass': Image.asset(
      'assets/small_icons/planta.png',
      fit: fitMedium,
    ), // example icon
    'bug': Image.asset('assets/small_icons/bicho.png', fit: fitMedium),
    'normal': Image.asset('assets/small_icons/normal.png', fit: fitMedium),
    'flying': Image.asset('assets/small_icons/volador.png', fit: fitMedium),
    'poison': Image.asset('assets/small_icons/veneno.png', fit: fitMedium),
    'fire': Image.asset('assets/small_icons/fuego.png', fit: fitMedium),
    'water': Image.asset('assets/small_icons/agua.png', fit: fitMedium),
    'electric': Image.asset('assets/small_icons/electrico.png', fit: fitMedium),
    'ground': Image.asset('assets/small_icons/tierra.png', fit: fitMedium),
    'fairy': Image.asset('assets/small_icons/hada.png', fit: fitMedium),
    'fighting': Image.asset('assets/small_icons/lucha.png', fit: fitMedium),
    'psychic': Image.asset('assets/small_icons/psiquico.png', fit: fitMedium),
    'rock': Image.asset('assets/small_icons/roca.png', fit: fitMedium),
    'steel': Image.asset('assets/small_icons/acero.png', fit: fitMedium),
    'ice': Image.asset('assets/small_icons/hielo.png', fit: fitMedium),
    'ghost': Image.asset('assets/small_icons/fantasma.png', fit: fitMedium),
    'dragon': Image.asset('assets/small_icons/dragon.png', fit: fitMedium),
    'dark': Image.asset('assets/small_icons/siniestro.png', fit: fitMedium),

    // more icons
  };

  static Map<String, String> imageStringUrl = {
    'grass': 'assets/large_icons/grass.png',

    // example icon
    'bug': 'assets/large_icons/bug.png',
    'normal': 'assets/large_icons/normal.png',
    'flying': 'assets/large_icons/flying.png',

    'poison': 'assets/large_icons/poison.png',

    'fire': 'assets/large_icons/fire.png',

    'water': 'assets/large_icons/water.png',

    'electric': 'assets/large_icons/electric.png',

    'ground': 'assets/large_icons/ground.png',

    'fairy': 'assets/large_icons/fairy.png',

    'fighting': 'assets/large_icons/fighting.png',

    'psychic': 'assets/large_icons/psychic.png',

    'rock': 'assets/large_icons/rock.png',

    'steel': 'assets/large_icons/steel.png',

    'ice': 'assets/large_icons/ice.png',

    'ghost': 'assets/large_icons/ghost.png',

    'dragon': 'assets/large_icons/dragon.png',

    'dark': 'assets/large_icons/dark.png',
  };

  static Map<String, String> largeImageStringUrl = {
    'grass': 'assets/large_icons/grass.png',
    'bug': 'assets/large_icons/bug.png',
    'normal': 'assets/large_icons/normal.png',
    'flying': 'assets/large_icons/flying.png',
    'poison': 'assets/large_icons/poison.png',
    'fire': 'assets/large_icons/fire.png',
    'water': 'assets/large_icons/water.png',
    'electric': 'assets/large_icons/electric.png',
    'ground': 'assets/large_icons/ground.png',
    'fairy': 'assets/large_icons/fairy.png',
    'fighting': 'assets/large_icons/fighting.png',
    'psychic': 'assets/large_icons/psychic.png',
    'rock': 'assets/large_icons/rock.png',
    'steel': 'assets/large_icons/steel.png',
    'ice': 'assets/large_icons/ice.png',
    'ghost': 'assets/large_icons/ghost.png',
    'dragon': 'assets/large_icons/dragon.png',
    'dark': 'assets/large_icons/dark.png',
  };
}
