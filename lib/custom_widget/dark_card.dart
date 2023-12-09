import 'package:flutter/material.dart';
import 'package:smart_home/app_colors.dart';

class DarkCard extends StatelessWidget {
  const DarkCard(
      {super.key,
      this.height = 75.0,
      this.width = 75,
      this.hPadding,
      this.vPadding,
      this.child,
      this.reverseColor = false,
      this.isCircle = false,
      this.reverseBorder = false});

  final double height;
  final double width;
  final double? vPadding;
  final double? hPadding;
  final Widget? child;
  final bool reverseColor;
  final bool reverseBorder;
  final bool isCircle;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
            gradient: LinearGradient(
              colors: const [bgDarkColor, bgBrightColor],
              begin:
                  reverseBorder ? Alignment.centerRight : Alignment.bottomLeft,
              end: reverseBorder ? Alignment.centerLeft : Alignment.topRight,
            ),
            borderRadius: isCircle ? null : BorderRadius.circular(15.0),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(
            vertical: vPadding ?? 12.0,
            horizontal: hPadding ?? 12.0,
          ),
          height: height - 5,
          width: width - 5,
          decoration: BoxDecoration(
            shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
            gradient: LinearGradient(
              colors: (reverseColor)
                  ? [fgBrightColor, fgDarkColor]
                  : [fgDarkColor, fgBrightColor],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              stops: const [0.2,0.9]
            ),
            borderRadius: isCircle ? null : BorderRadius.circular(15.0),
          ),
          child: child,
        ),
      ],
    );
  }
}
