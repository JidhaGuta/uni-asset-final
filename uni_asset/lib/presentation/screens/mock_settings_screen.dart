import 'package:flutter/material.dart';

class MockSettingsScreen extends StatelessWidget {
  const MockSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: const [
          ListTile(leading: Icon(Icons.lock), title: Text('Change Password')),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Notification Preferences'),
          ),
          ListTile(
            leading: Icon(Icons.color_lens),
            title: Text('Theme Settings'),
          ),
        ],
      ),
    );
  }
}
