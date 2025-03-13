import 'package:flutter/material.dart';

import 'package:aller_scan/screens/history.dart';
import 'package:aller_scan/screens/settings.dart';
import 'package:aller_scan/screens/scaner.dart';

// Ventana interactiva para que el usuario pueda acceder a las
// diferentes ventanas
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  final List _screens = [
    Scanner(),
    History(),
    Settings()
  ];

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "AllerScan",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 35
          ),
        )
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: const Color.fromARGB(255, 102, 102, 102),
        onTap: _navigateBottomBar,
        // Los label tienen que estar si o si
        // están sin texto ya que queda mejor
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home
            ),
            label: ""
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.history
            ),
            label: ""
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: ""
          )
        ]
      ),
      body: _screens[_selectedIndex]
    );
  }
}