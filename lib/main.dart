import 'package:flutter/material.dart';
import 'package:imc/pages/calculate_imc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const CalculateIMC(),
      routes: {
        '/calculateIMC': (context) => const CalculateIMC(),
      },
    );
  }
}