// import 'package:app/presentation/pages/analytics/analytics.dart';
import 'package:app/presentation/pages/generate_card/generate_card.dart';
// import 'package:app/presentation/pages/landing/landing.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const GenerateCard(),
    );
  }
}
