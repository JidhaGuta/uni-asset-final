import 'package:flutter/material.dart';
import '../../data/services/mock_api_service.dart';
import '../../data/repositories/device_repository.dart';
import '../../domain/usecases/login_user.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _idController = TextEditingController();
  final _passwordController = TextEditingController();
  final _api = MockApiService();
  late final DeviceRepository _repo;
  late final LoginUser _loginUsecase;
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _repo = DeviceRepository(_api);
    _loginUsecase = LoginUser(_repo);
  }

  void _login() async {
    setState(() => _loading = true);
    final success = await _loginUsecase.call(
      _idController.text.trim(),
      _passwordController.text.trim(),
    );
    setState(() => _loading = false);

    if (success) {
      Navigator.pushReplacementNamed(context, '/devices');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid credentials!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('UniAsset Login')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _idController,
              decoration: InputDecoration(labelText: 'Student ID'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            _loading
                ? const CircularProgressIndicator()
                : ElevatedButton(onPressed: _login, child: const Text('Login')),
          ],
        ),
      ),
    );
  }
}