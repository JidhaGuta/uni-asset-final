import '../services/mock_api_service.dart';
import '../models/device_model.dart';

class DeviceRepository {
  final MockApiService api;
  DeviceRepository(this.api);

  Future<bool> login(String studentId, String password) async {
    return await api.login(studentId, password);
  }

  Future<List<DeviceModel>> getDevices() async {
    return await api.getDevices();
  }
}