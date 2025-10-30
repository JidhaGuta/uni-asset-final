import 'package:flutter/material.dart';
import 'register_device_screen.dart';
import 'view_devices_screen.dart';
import 'mock_profile_screen.dart';
import 'mock_settings_screen.dart';

class HomeScreen extends StatefulWidget {
  final String? studentId;
  const HomeScreen({super.key, this.studentId});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Mock data (replace with real backend data later)
  final String name = "Jidha Guta";
  final String department = "Software Engineering";
  final int year = 5;
  final String imagePath = "assets/images/profile.jpg"; // local image

  int notificationCount = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("UniAsset Dashboard"),
        actions: [
          // 🔔 Notification icon
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('No new notifications')),
                  );
                },
              ),
              if (notificationCount > 0)
                Positioned(
                  right: 10,
                  top: 10,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '$notificationCount',
                      style: const TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  ),
                ),
            ],
          ),

          // 🚪 Logout
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(name),
              accountEmail: const Text("jidha.guta@ju.edu.et"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage(imagePath),
              ),
              decoration: const BoxDecoration(color: Colors.blue),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MockProfileScreen(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MockSettingsScreen(),
                  ),
                );
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.add_box),
              title: const Text('Register Your Device'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RegisterDeviceScreen(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.devices),
              title: const Text('View Your Devices'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ViewDevicesScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 🧍‍♂️ Profile image
            CircleAvatar(radius: 60, backgroundImage: AssetImage(imagePath)),
            const SizedBox(height: 16),

            // 👋 Welcome text
            Text(
              "Welcome $name",
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            // 🧑‍💻 Department
            Text(
              "Department: $department",
              style: const TextStyle(fontSize: 18, color: Colors.black54),
            ),

            const SizedBox(height: 8),

            // 🎓 Current year
            Text(
              "Current Year: $year",
              style: const TextStyle(fontSize: 18, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}
