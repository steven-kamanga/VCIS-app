import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    Color secondary = HexColor("#eafefd");

    return Scaffold(
      backgroundColor: secondary,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
