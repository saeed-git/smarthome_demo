import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_home/screens/temp.dart';
import './screens/home.dart';

void main() {
  runApp(const SmartHomeApp());
}

class SmartHomeApp extends StatelessWidget {
  const SmartHomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Smart Home',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey.shade700),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: GoRouter(initialLocation: '/', routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const MyHomePage(),
        ),
        GoRoute(
          path: '/temp',
          builder: (context, state) => const TemperaturePage(),
        ),
      ]),
    );
  }
}
