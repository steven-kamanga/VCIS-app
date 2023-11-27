// import 'package:app/presentation/pages/authentication/login.dart';
import 'package:app/presentation/pages/wallet/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Wallet(),
      theme: ThemeData(
        useMaterial3: true,
      ),
    );
  }
}
