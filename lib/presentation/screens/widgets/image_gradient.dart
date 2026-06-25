import 'package:flutter/material.dart';

class ImageGradient extends StatelessWidget {
  const ImageGradient(this.name, {super.key});

  final String name;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (rect) {
        return LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.white.withAlpha(255), Colors.white.withAlpha(30)],
        ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
      },
      blendMode: BlendMode.srcIn,
      child: Image.asset(name),
    );
  }
}
