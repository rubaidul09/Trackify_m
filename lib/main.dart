import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const TrakifyApp());
}

class TrakifyApp extends StatelessWidget {
  const TrakifyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Trakify',
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}