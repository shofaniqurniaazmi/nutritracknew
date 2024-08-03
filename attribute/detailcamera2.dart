import 'package:flutter/material.dart';
import 'dart:io';
import 'package:nutritrack/fitur/archive.dart'; 

class DetailCamera2 extends StatelessWidget {
  final String imagePath;
  final int portion;

  DetailCamera2({required this.imagePath, required this.portion});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Camera 2'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Image.file(File(imagePath)),
          ),
          Text(
            'Total $portion Porsi Makanan',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          ElevatedButton(
            onPressed: () {
              // Navigasi ke halaman Archive
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Archive(),
                ),
              );
            },
            child: Text('SAVE'),
          ),
        ],
      ),
    );
  }
}
