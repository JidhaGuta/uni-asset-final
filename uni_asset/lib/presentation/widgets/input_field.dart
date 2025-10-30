  import 'package:flutter/material.dart';


  class InputField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool isPassword;


  const InputField({
  required this.controller,
  required this.label,
  this.isPassword = false,
  super.key,
  });


  @override
  Widget build(BuildContext context) {
  return Padding(
  padding: const EdgeInsets.only(bottom: 16.0),
  child: TextField(
  controller: controller,
  obscureText: isPassword,
  decoration: InputDecoration(
  labelText: label,
  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
  ),
  ),
  );
  }
  }