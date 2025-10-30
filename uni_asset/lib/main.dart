import 'package:flutter/material.dart';
import 'presentation/screens/login_screen.dart';
import 'presentation/screens/device_list_screen.dart';

void main() {
  runApp(UniAssetApp());
}

class UniAssetApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UniAsset',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/devices': (context) => DeviceListScreen(),
      },
    );
  }
}