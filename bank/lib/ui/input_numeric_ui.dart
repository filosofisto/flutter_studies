import 'package:flutter/material.dart';

class InputNumber extends StatelessWidget {
  const InputNumber({
      required this.controller,
      required this.text,
      required this.hint,
      this.icon});

  final TextEditingController controller;
  final String text;
  final String hint;
  final Icon? icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controller,
        style: TextStyle(fontSize: 24.0),
        decoration: InputDecoration(
          icon: icon,
          labelText: text,
          hintText: hint,
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}
