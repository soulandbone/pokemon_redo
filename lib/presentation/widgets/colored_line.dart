import 'package:flutter/material.dart';

class ColoredLine extends StatelessWidget {
  const ColoredLine({
    required this.backgroundColor,
    required this.fillColor,
    required this.genderRate,
    super.key,
  });

  final Color backgroundColor;
  final Color fillColor;
  final int genderRate;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: backgroundColor,
              ),
              margin: EdgeInsets.symmetric(horizontal: 10),
              height: 8,
              width: double.infinity,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: fillColor,
              ),
              margin: EdgeInsets.symmetric(horizontal: 10),
              height: 8,
              width: MediaQuery.of(context).size.width * ((8 - genderRate) / 8),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.male_outlined),
                Text(
                  '${((8 - genderRate) / 8 * 100)} %',
                  style: TextStyle(fontSize: 11),
                ),
              ],
            ),
            Row(
              children: [
                Icon(Icons.female_outlined),
                Text(
                  '${((genderRate) / 8 * 100)} %',
                  style: TextStyle(fontSize: 11),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
