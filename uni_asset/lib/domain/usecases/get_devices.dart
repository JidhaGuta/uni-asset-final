import '../../domain/entities/device.dart';
import '../../data/repositories/device_repository.dart';

class GetDevices {
  final DeviceRepository repository;
  GetDevices(this.repository);

  Future<List<Device>> call() async {
    return await repository.getDevices();
  }
}