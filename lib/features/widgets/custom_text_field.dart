import 'package:flutter/material.dart';
import 'package:homescout/core/theme/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final IconData? prefixIcon;
  final bool obscureText;
  final TextInputType keyboardType;
  final Widget? suffixIcon;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.prefixIcon,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
            color: AppColors.primary, fontSize: 14), // Stylish hint text
        contentPadding: EdgeInsets.symmetric(
            vertical: 14, horizontal: 16), // Better spacing
        prefixIcon: prefixIcon != null
            ? Icon(prefixIcon, size: 20, color: AppColors.primary)
            : null,
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: Colors.white, // Background color
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide:
              BorderSide(color: Colors.teal, width: 2), // Highlighted border
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.redAccent, width: 2),
        ),
      ),
      obscureText: obscureText,
      keyboardType: keyboardType,
    );
  }
}
