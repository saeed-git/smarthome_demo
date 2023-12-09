import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:smart_home/app_colors.dart';

class TempSweepPainter extends CustomPainter {
  ///set degree from 12 to 31
  TempSweepPainter(double degree) : assert(degree >= 12 && degree < 32) { this.degree = (degree - 11) * 12;}
  late final double degree;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..shader = ui.Gradient.sweep(Offset(size.width / 2, size.height / 2),
          [ brightOrangeColor, darkOrangeColor], [0.0, 1.0], TileMode.mirror,150*pi/180 , 350*pi/180)
      ..strokeWidth = 10.0
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
    Rect rect = Rect.fromLTRB(0, 0, size.width, size.height);
    double startAngle = 150 * pi / 180;
    double sweepAngle = degree * pi / 180;
    canvas.drawArc(rect, startAngle, sweepAngle, false, paint);
  }

  @override
  bool shouldRepaint(TempSweepPainter oldDelegate) {
    if (degree != oldDelegate.degree) return true;
    return false;
  }
}
