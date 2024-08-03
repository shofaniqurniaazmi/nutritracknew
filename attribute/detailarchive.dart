import 'package:flutter/material.dart';

class Detailpage extends StatelessWidget {
  final String title;
  final String imageUrl;

  Detailpage({required this.title, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(imageUrl), // Change to Image.asset
            SizedBox(height: 16.0),
            Text(
              'Description of $title', // Placeholder description
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
