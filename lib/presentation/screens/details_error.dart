import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokemon_redo/constants/app_strings.dart';

class DetailsError extends StatelessWidget {
  const DetailsError({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 300, child: Image.asset('assets/poke_cute.png')),
        Text(
          textAlign: TextAlign.center,
          AppStrings.kMuyProntoDisponible,
          style: GoogleFonts.poppins(fontSize: 26, fontWeight: FontWeight.w500),
        ),
        Text(
          AppStrings.kEstamosTrabajando,
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
