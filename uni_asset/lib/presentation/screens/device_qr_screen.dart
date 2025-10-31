import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class DeviceQrScreen extends StatelessWidget {
  final Map<String, dynamic> device;

  const DeviceQrScreen({super.key, required this.device});

  @override
  Widget build(BuildContext context) {
    final qrData = '''
Device Category: ${device['category']}
Model: ${device['model']}
Serial: ${device['serial']}
Color: ${device['color']}
Owner: Jidha Guta
''';

    return Scaffold(
      appBar: AppBar(
        title: Text('${device['model']} QR Code'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Scan this QR Code at campus gates for verification',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            const SizedBox(height: 30),

            // QR code
            QrImageView(
              data: qrData,
              version: QrVersions.auto,
              size: 240.0,
              backgroundColor: Colors.white,
            ),

            const SizedBox(height: 30),

            Text(
              '${device['category']} - ${device['model']}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('Serial: ${device['serial']}'),
            Text('Color: ${device['color']}'),
            const SizedBox(height: 30),

            ElevatedButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('QR code saved for later use.')),
                );
              },
              icon: const Icon(Icons.download),
              label: const Text('Save QR'),
            ),
          ],
        ),
      ),
    );
  }
}
