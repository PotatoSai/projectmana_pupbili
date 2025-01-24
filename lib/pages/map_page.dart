import 'package:flutter/material.dart';

class MyMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lagoon Map'),
      ),
      body: Center(
        child: Image.asset(
          'lib/images/logo/map.png', // Replace with your image asset file name
          fit: BoxFit.cover, // This makes the image cover the entire screen
          width: double.infinity, // Ensures the image takes up the full width
          height: double.infinity, // Ensures the image takes up the full height
        ),
      ),
    );
  }
}
