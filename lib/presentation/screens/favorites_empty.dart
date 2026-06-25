import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokemon_redo/constants/app_strings.dart';

class FavoritesEmpty extends StatelessWidget {
  const FavoritesEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(width: 300, child: Image.asset('assets/magikarp.png')),
        Text(
          textAlign: TextAlign.center,
          AppStrings.kNoHasMarcadoFav,
          style: GoogleFonts.poppins(fontSize: 26, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 50),
        Text(
          textAlign: TextAlign.center,
          AppStrings.kHazClick,
          style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
