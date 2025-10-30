import 'package:flutter/material.dart';
import '../../data/services/mock_api_service.dart';
import '../../data/repositories/device_repository.dart';
import '../../presentation/widgets/device_card.dart';
import '../../domain/entities/device.dart';

class DeviceListScreen extends StatefulWidget {
  @override
  State<DeviceListScreen> createState() => _DeviceListScreenState();
}

class _DeviceListScreenState extends State<DeviceListScreen> {
  final _api = MockApiService();
  late final DeviceRepository _repo;
  late Future<List<Device>> _devicesFuture;

  @override
  void initState() {
    super.initState();
    _repo = DeviceRepository(_api);
    _devicesFuture = _repo.getDevices();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Registered Devices')),
      body: FutureBuilder<List<Device>>(
        future: _devicesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No devices registered.'));
          } else {
            final devices = snapshot.data!;
            return ListView.builder(
              itemCount: devices.length,
              itemBuilder: (context, index) {
                return DeviceCard(device: devices[index]);
              },
            );
          }
        },
      ),
    );
  }
}