import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.keyboardType,
    this.icon,
    this.onSaved,
    this.obscureText = false,
  });

  final String hintText;
  final TextInputType keyboardType;
  final Widget? icon;
  final void Function(String?)? onSaved;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      onSaved: onSaved,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'هذا الحقل مطلوب';
        }
        return null;
      },
      keyboardType: keyboardType,
      decoration: InputDecoration(
          suffixIcon: icon,
          hintText: hintText,
          hintStyle: TextStyle(
              color: const Color(0xFF949D9E),
              fontSize: 13,
              fontWeight: FontWeight.w700),
          filled: true,
          fillColor: Color(0xFFF9FAFA),
          border: buildBorder(),
          enabledBorder: buildBorder()),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          width: 1,
          color: Color(0xFFE6E9E9),
        ));
  }
}
