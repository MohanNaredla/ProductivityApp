import 'package:flutter/material.dart';
import 'package:productivity/utils/constants/colors.dart';

class RegisterText extends StatelessWidget {
  const RegisterText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text.rich(
      TextSpan(
          text: "Not a member? ",
          style: TextStyle(
            fontSize: 16,
          ),
          children: <TextSpan>[
            TextSpan(
              text: "Register Now",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: AppColors.secondary_color_variant,
              ),
            )
          ]),
    );
  }
}
