import 'package:flutter/material.dart';
import 'package:pokemon_redo/constants/app_colors.dart';

class DotLineIndicator extends StatelessWidget {
  final bool isFirstPage;

  const DotLineIndicator({super.key, required this.isFirstPage});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: isFirstPage
          ? [
              // Dash (line)
              Container(
                decoration: BoxDecoration(
                  color: AppColors.kBlueProgressIndicator,
                  borderRadius: BorderRadius.circular(15),
                ),
                width: 30,
                height: 8,
              ),
              SizedBox(width: 4),
              // Dot
              CircleAvatar(
                radius: 6,
                backgroundColor: AppColors.kCircleProgressIndicator,
              ),
            ]
          : [
              CircleAvatar(
                radius: 6,
                backgroundColor: AppColors.kCircleProgressIndicator,
              ),
              SizedBox(width: 8),
              // Dash (line)
              Container(
                decoration: BoxDecoration(
                  color: AppColors.kBlueProgressIndicator,
                  borderRadius: BorderRadius.circular(15),
                ),
                width: 30,
                height: 8,
              ),
            ],
    );
  }
}
