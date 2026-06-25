import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokemon_redo/constants/app_colors.dart';
import 'package:pokemon_redo/constants/app_strings.dart';
import 'package:pokemon_redo/presentation/screens/onboarding_2.dart';
import 'package:pokemon_redo/presentation/screens/widgets/dot_line_indicator.dart';

class OnBoarding1 extends StatelessWidget {
  const OnBoarding1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.kTitle,
          style: GoogleFonts.poppins(fontSize: 26, fontWeight: FontWeight.w500),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(bottom: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            //SizedBox(height: 200),
            Image.asset('assets/first_load_screen.png'),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                AppStrings.kTodosLosPok,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 26,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                AppStrings.kTodosLosPokSubtitle,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(fontSize: 14),
              ),
            ),
            DotLineIndicator(isFirstPage: true),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              height: 58,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: AppColors.kTextButton,
                  backgroundColor: AppColors.kBlueBackGroundButton,
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return OnBoarding2();
                      },
                    ),
                  );
                },
                child: Text(
                  AppStrings.kContinuar,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
