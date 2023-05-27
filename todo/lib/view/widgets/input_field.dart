import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField({
    this.controller,
    this.hint,
    super.key});

  final TextEditingController? controller;
  final String? hint;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(border: const OutlineInputBorder(),
      hintText: hint),
    );
  }
}
