import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField({this.controller, this.hint, super.key});

  final TextEditingController? controller;
  final String? hint;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration:
          InputDecoration(border: const OutlineInputBorder(), hintText: hint),
    );
  }
}

class InputFormField extends StatelessWidget {
  const InputFormField(
      {this.controller,
      this.hint,
      this.formKey,
      this.validator,
      this.onChanged,
      super.key});

  final TextEditingController? controller;
  final String? hint;
  final GlobalKey<FormFieldState<dynamic>>? formKey;
  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: formKey,
      validator: validator,
      controller: controller,
      onChanged: onChanged,
      decoration:
          InputDecoration(border: const OutlineInputBorder(), hintText: hint),
    );
  }
}
