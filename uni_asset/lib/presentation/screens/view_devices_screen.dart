import 'package:flutter/material.dart';
import 'device_qr_screen.dart';

class ViewDevicesScreen extends StatelessWidget {
  const ViewDevicesScreen({super.key});

  // Mock device data
  final List<Map<String, dynamic>> mockDevices = const [
    {
      'category': 'Laptop',
      'model': 'Dell XPS 13',
      'serial': 'D12345XPS',
      'color': 'Silver',
      'images': [
        'assets/images/laptop_front.png',
        'assets/images/laptop_back.png',
        'assets/images/laptop_side.png',
      ],
    },
    {
      'category': 'Phone',
      'model': 'Samsung Galaxy S24',
      'serial': 'SGS24SN9876',
      'color': 'Black',
      'images': [
        'assets/images/phone_front.png',
        'assets/images/phone_back.png',
        'assets/images/phone_side.png',
      ],
    },
    {
      'category': 'Tablet',
      'model': 'iPad Air',
      'serial': 'IPAIR4456',
      'color': 'Gray',
      'images': [
        'assets/images/tablet_front.png',
        'assets/images/tablet_back.png',
        'assets/images/tablet_side.png',
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('View Your Devices'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: mockDevices.length,
          itemBuilder: (context, index) {
            final device = mockDevices[index];
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              margin: const EdgeInsets.only(bottom: 16),
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Device Info
                    Text(
                      '${device['category']} - ${device['model']}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text('Serial: ${device['serial']}'),
                    Text('Color: ${device['color']}'),
                    const SizedBox(height: 10),

                    // Device Images (horizontal list)
                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: device['images'].length,
                        itemBuilder: (context, imgIndex) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                device['images'][imgIndex],
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 10),

                    // Buttons Row
                    Align(
                      alignment: Alignment.centerRight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton.icon(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) =>
                                          DeviceQrScreen(device: device),
                                ),
                              );
                            },
                            icon: const Icon(Icons.qr_code),
                            label: const Text('View QR Code'),
                          ),
                          const SizedBox(width: 10),
                          TextButton.icon(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Viewing details for ${device['model']}',
                                  ),
                                ),
                              );
                            },
                            icon: const Icon(Icons.info_outline),
                            label: const Text('Details'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
