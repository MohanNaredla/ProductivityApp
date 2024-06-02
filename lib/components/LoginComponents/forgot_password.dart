import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.fromLTRB(0, 10, 15, 0),
      child: SizedBox(
        width: double.infinity,
        child: Text(
          "Forgot Password?",
          textAlign: TextAlign.end,
        ),
      ),
    );
  }
}
