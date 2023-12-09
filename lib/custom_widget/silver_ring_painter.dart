import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import '../app_colors.dart';

class SilverRingPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..shader = ui.Gradient.linear(Offset(size.width, size.height),
          Offset(size.width/2, size.height/2), [bgBrightColor, bgDarkColor])
      ..strokeWidth = 3.0
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
    canvas.drawCircle(Offset(size.width/2, size.height/2), size.width/2, paint);
  }

  @override
  bool shouldRepaint(SilverRingPainter oldDelegate) {
    return false;
  }
}
