import 'package:flutter/material.dart';
import 'package:pokemon_redo/constants/app_maps.dart';

class WeaknessesGrid extends StatelessWidget {
  const WeaknessesGrid({required this.types, super.key});

  final List<String> types;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true, // Constrain height to content
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 3,
        crossAxisCount: 3, // Number of columns
        crossAxisSpacing: 5,
        mainAxisSpacing: 0,
      ),
      itemCount: types.length,
      itemBuilder: (context, index) {
        final typeName = types[index];
        return Center(
          child: SizedBox(
            height: 30,
            child: AppMaps.typeIconMapSmall[typeName] ?? SizedBox(),
          ),
        );
      },
    );
  }
}
