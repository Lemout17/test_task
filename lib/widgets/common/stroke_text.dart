import 'package:flutter/material.dart';
import 'package:test_task/theme/app_colors.dart';

class StrokeText extends StatelessWidget {
  final String text;
  final Color color;
  final Color strokeColor;
  final double size;
  final FontWeight fontWeight;
  final double strokeWidth;

  const StrokeText(
    this.text, {
    super.key,
    this.color = AppColors.white,
    this.strokeColor = AppColors.purple,
    this.size = 30,
    this.fontWeight = FontWeight.w400,
    this.strokeWidth = 3,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(
          textAlign: TextAlign.center,
          text,
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
            fontSize: size,
            fontWeight: fontWeight,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = strokeWidth
              ..color = strokeColor,
          ),
        ),
        Text(
          textAlign: TextAlign.center,
          text,
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
            fontSize: size,
            fontWeight: fontWeight,
            color: color,
          ),
        ),
      ],
    );
  }
}
