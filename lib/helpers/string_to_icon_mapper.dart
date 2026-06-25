import 'package:flutter/material.dart';
import 'package:pokemon_redo/constants/app_maps.dart';

List<Widget> mapStringToIcons(List<String> types) {
  return types.map((type) => AppMaps.typeIconMapSmall[type]!).toList();
}

List<Widget> mapStringToIconsMedium(List<String> types) {
  return types.map((type) => AppMaps.typeIconMapMedium[type]!).toList();
}
