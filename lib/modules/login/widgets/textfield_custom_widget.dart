import 'package:flutter/material.dart';
import 'package:gotraining/core/utils/colors/app_colors.dart';
import 'package:validatorless/validatorless.dart';

class TextFielCustom extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final Validatorless validatorless;
  const TextFielCustom({
    required this.controller,
    required this.title,
    required this.validatorless,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: TextFormField(
        style: const TextStyle(color: Colors.white),
        controller: controller,
        decoration: InputDecoration(
          label: Text(title),
          labelStyle: const TextStyle(
              color: ColorsApp.colorItem,
              fontSize: 20,
              fontWeight: FontWeight.w900),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: ColorsApp.colorItem),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: ColorsApp.colorItem),
          ),
        ),
      ),
    );
  }
}
