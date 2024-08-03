import 'package:flutter/material.dart';
import 'package:nutritrack/attribute/bottom.dart';

class Blank extends StatelessWidget {
  const Blank({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.purple,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NavigationMenu()),
          );
        },
        child: Icon(Icons.arrow_forward),
        backgroundColor: Colors.white, // Warna latar belakang tombol
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat, // Tombol akan berada di sebelah kanan bawah
    );
  }
}