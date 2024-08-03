import 'package:flutter/material.dart';
import 'dart:io';
import 'package:nutritrack/attribute/detailcamera2.dart';

class DetailCamera1 extends StatelessWidget {
  final String imagePath;

  DetailCamera1({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Camera 1'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Image.file(File(imagePath)),
          ),
          Text(
            'Pilih Jumlah Porsimu!',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: ListView(
              children: List.generate(5, (index) {
                int portion = index + 1;
                return ListTile(
                  title: Text('$portion Porsi'),
                  trailing: Icon(Icons.check_circle, color: Colors.green),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailCamera2(
                          imagePath: imagePath,
                          portion: portion,
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
