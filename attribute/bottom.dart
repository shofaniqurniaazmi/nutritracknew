import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:nutritrack/fitur/calendar.dart'; 
import 'package:nutritrack/fitur/home.dart';
import 'package:nutritrack/fitur/kamera.dart';
import 'package:nutritrack/fitur/archive.dart';
import 'package:nutritrack/fitur/profile.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({Key? key}) : super(key: key);

  @override
  _NavigationMenuState createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  List<Widget> _screens = [
    HomePage(),
    Calendar(), 
    Camera(),
    Archive(),
    Profile(),
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex], // Display the selected screen
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: Colors.purple, // Warna background menjadi ungu
        style: TabStyle.fixedCircle, // Gaya setengah lingkaran
        activeColor: Colors.white, // Warna ikon yang dipilih menjadi putih
        color: Colors.white.withOpacity(0.6), // Warna ikon yang tidak dipilih menjadi putih dengan opasitas
        items: [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.calendar_today, title: 'Calendar'),
          TabItem(icon: Icons.camera, title: 'Camera'),
          TabItem(icon: Icons.archive, title: 'Archive'),
          TabItem(icon: Icons.account_circle, title: 'Profile'),
        ],
        initialActiveIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
