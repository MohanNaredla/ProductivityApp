import 'package:flutter/material.dart';
import 'package:productivity/utils/constants/colors.dart';
import 'package:productivity/utils/device/device_utils.dart';

class InputField extends StatelessWidget {
  const InputField({
    super.key,
    required this.hint,
    this.suffixIcon,
    required this.controller,
    this.keyboardType,
    this.isObscure = false,
  });

  final String hint;
  // ignore: prefer_typing_uninitialized_variables
  final suffixIcon;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final bool isObscure;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: isObscure,
      cursorColor: AppColors.secondary_color_variant,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        constraints: BoxConstraints(
          maxHeight: DeviceUtils.getHeight(context) * 0.065,
          maxWidth: DeviceUtils.getWidth(context) * 0.85,
        ),
        hintText: hint,
        filled: true,
        fillColor: AppColors.input_light,
        hintStyle: const TextStyle(
          color: Color.fromRGBO(0, 0, 0, 0.5),
          fontSize: 15,
          letterSpacing: 0.3,
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 15),
          child: suffixIcon,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: Color.fromRGBO(255, 255, 255, 0.1),
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: Color.fromRGBO(255, 255, 255, 0.1),
            width: 1.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: Color.fromRGBO(255, 255, 255, 0.1),
            width: 1.0,
          ),
        ),
      ),
    );
  }
}
