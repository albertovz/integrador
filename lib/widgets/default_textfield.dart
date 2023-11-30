import 'package:flutter/material.dart';
import 'package:learnlinked/features/auth/presentation/utils/base_color.dart';

class DefaultTextfield extends StatelessWidget {
  String label;
  String error;
  String? initialValue;
  IconData icon;
  bool obscureTexT;
  TextEditingController? controller;
  Function(String text) onChanged;

  DefaultTextfield(
      {required this.label,
      required this.icon,
      required this.onChanged,
      this.error = '',
      this.initialValue,
      this.obscureTexT = false,
      this.controller
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      initialValue: initialValue,
      onChanged: (value) {
        onChanged(value);
      },
      decoration: InputDecoration(
          label: Text(
            label,
            style: const TextStyle(color: LETTER_COLOR),
          ),
          errorText: error,
          suffixIcon: Icon(
            icon,
            color: Colors.white,
          )),
      style: const TextStyle(color: LETTER_COLOR),
      obscureText: obscureTexT,
    );
  }
}
