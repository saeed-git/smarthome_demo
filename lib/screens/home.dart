import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_home/custom_widget/devices_card.dart';
import '../app_colors.dart';
import '../custom_widget/dark_card.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
            children: <Widget>[
              SizedBox(
                height: 50.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () => GoRouter.of(context).push('/temp'),
                      child: const Icon(
                        Icons.menu,
                        color: brightTextColor,
                      ),
                    ),
                    const Text(
                      'Welcome Home',
                      style: TextStyle(color: brightTextColor, fontSize: 16),
                    ),
                    const Stack(
                      alignment: Alignment.center,
                      children: [
                        Icon(
                          Icons.notifications,
                          color: brightTextColor,
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: Icon(
                            size: 6,
                            Icons.circle,
                            color: darkOrangeColor,
                          ),
                        ),
                      ],
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
                      'Sam Parker',
                      style: TextStyle(
                        fontSize: 28,
                        color: darkOrangeColor,
                      ),
                    ),
                    Text(
                      'Anything, I can help you with?',
                      style: TextStyle(
                        fontSize: 18,
                        color: darkTextColor,
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        DarkCard(
                          width: 120,
                          height: 80,
                          reverseColor: true,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '23°C',
                                style: TextStyle(
                                    color: brightTextColor, fontSize: 18),
                              ),
                              Text(
                                'Indoor Temp',
                                style: TextStyle(
                                    color: darkTextColor, fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                        DarkCard(
                          width: 160,
                          height: 80,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '48%',
                                style: TextStyle(
                                    color: brightTextColor, fontSize: 18),
                              ),
                              Text(
                                'Indoor Humadity',
                                style: TextStyle(
                                    color: darkTextColor, fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50.0,
                width: deviceSize.width,
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children: const [
                    SizedBox(
                      width: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          Text(
                            'Living Room',
                            style: TextStyle(
                              color: brightTextColor,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            child: Icon(
                              Icons.circle,
                              size: 10,
                              color: brightTextColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 30.0,
                      ),
                      child: Text(
                        'Dinning',
                        style: TextStyle(
                          color: darkTextColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 30.0,
                      ),
                      child: Text(
                        'Kitchen',
                        style: TextStyle(
                          color: darkTextColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 30.0,
                      ),
                      child: Text(
                        'Bedroom',
                        style: TextStyle(
                          color: darkTextColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 30.0,
                      ),
                      child: Text(
                        'Library',
                        style: TextStyle(
                          color: darkTextColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 390,
                child: GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10.0,
                  ),
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 20, bottom: 0),
                  scrollDirection: Axis.vertical,
                  children: const [
                    DevicesCard(title: 'A/C', icon: Icons.ac_unit_rounded),
                    DevicesCard(title: 'WiFi', icon: Icons.router),
                    DevicesCard(title: 'Light', icon: Icons.light),
                    DevicesCard(title: 'TV', icon: Icons.tv)
                  ],
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              SizedBox(
                width: deviceSize.width,
                height: 110,
                child: const DarkCard(
                  width: 350.0,
                  height: 85.0,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 10,
                        child: Text(
                          'Arctic',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: brightTextColor),
                        ),
                      ),
                      Positioned(
                        left: 10,
                        bottom: 10,
                        child: Text(
                          'Arabella',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: darkTextColor),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: SizedBox(
                          width: 110,
                          child: Row(
                            children: [
                              Icon(
                                Icons.skip_previous,
                                color: darkTextColor,
                              ),
                              SizedBox(width: 10,),
                              Icon(
                                Icons.pause,
                                color: darkTextColor,
                              ),
                              SizedBox(width: 10,),
                              Icon(
                                Icons.skip_next,
                                color: darkTextColor,
                              ),
                            ],
                          ),
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
