import 'package:flutter/material.dart';
import 'package:smart_home/app_colors.dart';
import 'package:smart_home/custom_widget/dark_card.dart';

class DevicesCard extends StatefulWidget {
  const DevicesCard({super.key, required this.title, required this.icon});

  final String title;
  final IconData icon;

  @override
  State<DevicesCard> createState() => _DevicesCardState();
}

class _DevicesCardState extends State<DevicesCard> {
  bool active = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          active = !active;
        });
      },
      child: DarkCard(
        height: 170,
        width: 160,
        child: Stack(
          children: [
            Positioned(
              left: 5,
              top: 5,
              child: DarkCard(
                width: 60,
                height: 60,
                isCircle: true,
                reverseColor: active,
                child: Center(
                  child: ShaderMask(
                    blendMode: BlendMode.srcIn,
                    shaderCallback: (Rect bounds) => LinearGradient(
                      begin:
                          active ? Alignment.centerLeft : Alignment.bottomLeft,
                      end: active ? Alignment.centerRight : Alignment.topRight,
                      colors: active
                          ? [darkOrangeColor, brightOrangeColor]
                          : [
                              Colors.grey.shade800,
                              Colors.grey.shade500,
                              Colors.grey.shade800,
                            ],
                    ).createShader(bounds),
                    child: Icon(
                      widget.icon,
                      size: 32,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 10,
              right: 5,
              child: DarkCard(
                height: 55,
                width: 25,
                hPadding: 0,
                vPadding: 0,
                reverseBorder: true,
                child: AnimatedAlign(
                  alignment:
                      active ? Alignment.topCenter : Alignment.bottomCenter,
                  duration: const Duration(milliseconds: 350),
                  curve: Curves.easeInOutCubic,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 22,
                        width: 22,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                              colors: [bgDarkColor, bgBrightColor],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              stops: [0.2, 0.8]),
                        ),
                      ),
                      AnimatedCrossFade(
                        firstChild: Container(
                          height: 18,
                          width: 18,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                                colors: [bgDarkColor, bgBrightColor],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                stops: [0.3, 0.9]),
                          ),
                        ),
                        secondChild: Container(
                          height: 18,
                          width: 18,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                                colors: [darkOrangeColor, brightOrangeColor],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                stops: [0.3, 0.9]),
                          ),
                        ),
                        crossFadeState: active ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                        duration: const Duration(milliseconds: 350),
                      ),
                      /*Container(
                        height: 18,
                        width: 18,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                              colors: active ? [darkOrangeColor ,brightOrangeColor] : [bgDarkColor, bgBrightColor],
                              begin: active ? Alignment.centerLeft : Alignment.topLeft,
                              end: active ? Alignment.centerRight : Alignment.bottomRight,
                              stops: [0.3, 0.9]),
                        ),
                      ),*/
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 30,
              left: 10,
              child: Text(
                widget.title,
                style: const TextStyle(
                    fontSize: 18,
                    color: brightTextColor,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 10,
              child: Text(
                active ? 'On' : 'Off',
                style: const TextStyle(color: darkTextColor, fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
