import 'package:flutter/material.dart';

class TextFielCustom extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final String? Function(String?)? validatorless;
  const TextFielCustom({
    required this.controller,
    required this.title,
    required this.validatorless,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
      child: TextFormField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white.withOpacity(0.4),
          hintText: title,
          hintStyle: const TextStyle(color: Colors.white),
        ),
        style: const TextStyle(color: Colors.white),
        validator: validatorless,
        controller: controller,
      ),
    );
  }
}
