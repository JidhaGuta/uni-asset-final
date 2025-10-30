import 'package:flutter/material.dart';

class MockProfileScreen extends StatelessWidget {
  const MockProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Name: Jidha Guta', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Student ID: JU12345', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Email: jidha@ju.edu.et', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
