import 'package:flutter/material.dart';
import '../../domain/entities/device.dart';

class DeviceCard extends StatelessWidget {
  final Device device;
  const DeviceCard({required this.device, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: Image.network(
          device.imageUrl,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
        title: Text(
          '${device.name} (${device.model})',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          'Serial: ${device.serialNumber}\nStatus: ${device.status}',
        ),
        isThreeLine: true,
      ),
    );
  }
}
