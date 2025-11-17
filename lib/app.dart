// Innehåller materialapp och grundläggande app-konfiguration
import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'widgets/calculator_layout.dart';

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Titel',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const StartPage(),
    );
  }
}

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Kalkylator EXP7000', style: TextStyle(fontSize: 35)),
      ),
      body: Center(
        child: CalculatorLayout(),
      ),
    );
  }
}
