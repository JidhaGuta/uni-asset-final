import 'dart:async';
import '../../data/models/device_model.dart';

class MockApiService {
  Future<bool> login(String studentId, String password) async {
    await Future.delayed(const Duration(seconds: 1));
    return studentId == 'JU12345' && password == '1234';
  }

  Future<List<DeviceModel>> getDevices() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      DeviceModel(
        id: '1',
        name: 'Laptop',
        model: 'HP 250 G7',
        serialNumber: 'SN123456',
        imageUrl: 'https://via.placeholder.com/150',
        status: 'approved',
      ),
      DeviceModel(
        id: '2',
        name: 'Tablet',
        model: 'Samsung Tab A7',
        serialNumber: 'SN987654',
        imageUrl: 'https://via.placeholder.com/150',
        status: 'pending',
      ),
    ];
  }
}