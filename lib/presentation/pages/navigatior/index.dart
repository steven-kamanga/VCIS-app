import 'package:app/presentation/pages/analytics/analytics.dart';
import 'package:app/presentation/pages/generate_card/generate_card.dart';
import 'package:app/presentation/pages/landing/landing.dart';
import 'package:app/presentation/pages/settings/card_settings/card_settings.dart';
import 'package:flutter/material.dart';

class NavigationBarRouterTab extends StatefulWidget {
  const NavigationBarRouterTab({super.key});

  @override
  State<NavigationBarRouterTab> createState() => _NavigationBarRouterTabState();
}

class _NavigationBarRouterTabState extends State<NavigationBarRouterTab> {
  int selectedIndex = 0;

  void navBottomBar(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  final List<Widget> pages = const [
    Landing(),
    Analytics(),
    GenerateCard(),
    CardSettings(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        unselectedItemColor: Colors.grey,
        unselectedLabelStyle:
            const TextStyle(color: Colors.black, fontSize: 10),
        unselectedIconTheme: const IconThemeData(size: 20),
        selectedIconTheme: const IconThemeData(size: 35),
        onTap: navBottomBar,
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.analytics),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.credit_card),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: '',
          ),
        ],
      ),
    );
  }
}
