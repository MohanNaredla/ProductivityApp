import 'package:flutter/material.dart';
import 'package:productivity/utils/authentication/google_auth.dart';
import 'package:productivity/utils/constants/colors.dart';

class LoginIcons extends StatelessWidget {
  const LoginIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () => GoogleAuth().signInWithGoogle(),
          child: Container(
            margin: const EdgeInsets.only(right: 14),
            decoration: BoxDecoration(
              color: AppColors.input_light,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Image.asset(
                "lib/assets/images/google.png",
                width: 40,
                height: 40,
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () => GoogleAuth().signInWithGit(),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.input_light,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Image.asset(
                "lib/assets/images/github.png",
                width: 40,
                height: 40,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
