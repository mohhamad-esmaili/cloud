import 'dart:math';

import 'package:cloud/Core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class SemiCirclePainter extends CustomPainter {
  final num value;
  final int maxValue;

  SemiCirclePainter({required this.value, required this.maxValue});

  @override
  void paint(Canvas canvas, Size size) {
    final paintBackground = Paint()
      ..color = Colors.grey.shade300
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20
      ..strokeCap = StrokeCap.round;

    final paintForeground = Paint()
      ..color = AppColors.primaryColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20
      ..strokeCap = StrokeCap.round;

    const startAngle = pi;
    final sweepAngle = pi * (value / maxValue);

    canvas.drawArc(
      Rect.fromLTRB(0, 0, size.width, size.height * 2),
      startAngle,
      pi,
      false,
      paintBackground,
    );

    canvas.drawArc(
      Rect.fromLTRB(0, 0, size.width, size.height * 2),
      startAngle,
      sweepAngle,
      false,
      paintForeground,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
