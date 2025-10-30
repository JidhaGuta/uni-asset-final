import '../../data/repositories/device_repository.dart';

class LoginUser {
  final DeviceRepository repository;
  LoginUser(this.repository);

  Future<bool> call(String studentId, String password) async {
    return await repository.login(studentId, password);
  }
}