import 'package:flutter/material.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key, required this.headerText});

  final String headerText;

  @override
  Widget build(BuildContext context) {
    return Text(
      headerText,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 48,
      ),
    );
  }
}
