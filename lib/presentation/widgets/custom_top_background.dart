import 'package:flutter/material.dart';

class CustomTopBackground extends CustomPainter {
  CustomTopBackground({required this.color});
  final Color? color;
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color ?? Colors.grey;

    // Define the path for the custom shape
    final path = Path()
      ..moveTo(0, 0) //
      ..lineTo(size.width, 0) //
      ..lineTo(size.width, size.height * 0.7) //
      ..quadraticBezierTo(
        size.width / 2,
        size.height, //
        0,
        size.height * 0.7, //
      )
      ..close(); // Close the path

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false; // Static shape, no need to repaint
  }
}
