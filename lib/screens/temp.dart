import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_home/custom_widget/dark_card.dart';
import 'package:smart_home/custom_widget/silver_ring_painter.dart';
import 'package:smart_home/custom_widget/temp_sweep_painter.dart';

import '../app_colors.dart';

class TemperaturePage extends StatefulWidget {
  const TemperaturePage({super.key});

  @override
  State<StatefulWidget> createState() => _TemperatureState();
}

class _TemperatureState extends State<TemperaturePage> {
  double degree = 21;

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFF353A40),
      body: Container(
        height: deviceSize.height,
        width: deviceSize.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [bgDarkColor, fgBrightColor],
            stops: [0.1, 0.8],
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () => GoRouter.of(context).pop(),
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        color: brightTextColor,
                      ),
                    ),
                    const Text(
                      'Room Temperature',
                      style: TextStyle(color: brightTextColor, fontSize: 16),
                    ),
                    const Icon(
                      Icons.notifications,
                      color: brightTextColor,
                    ),
                  ],
                ),
              ),
              Container(
                height: 80,
                margin: const EdgeInsets.only(top: 20.0, left: 30.0),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Living Room',
                      style: TextStyle(
                        fontSize: 28,
                        color: darkOrangeColor,
                      ),
                    ),
                    Text(
                      'Please set room temperature',
                      style: TextStyle(
                        fontSize: 18,
                        color: darkTextColor,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 50.0,
              ),
              Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    DarkCard(
                      width: 250,
                      height: 250,
                      isCircle: true,
                      child: Center(
                        child: Text(
                          '${degree.round()}°C',
                          style: const TextStyle(color: brightTextColor, fontSize: 32),
                        ),
                      ),
                    ),
                    CustomPaint(
                        size: const Size.square(200.0), painter: SilverRingPainter()),
                    CustomPaint(
                      size: const Size.square(200),
                      painter: TempSweepPainter(degree),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 70.0,
              ),
              Center(
                child: DarkCard(
                  height: 150.0,
                  width: 70,
                  reverseColor: true,
                  reverseBorder: true,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => setState(() {
                          if (degree < 31) {
                            degree++;
                          }
                        }),
                        child: const Icon(
                          Icons.add,
                          color: darkTextColor,
                        ),
                      ),
                      Container(width: 60, height: 2, color: darkTextColor),
                      GestureDetector(
                        onTap: () => setState(() {
                          if (degree > 12) {
                            degree--;
                          }
                        }),
                        child: const Icon(
                          Icons.remove,
                          color: darkTextColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
