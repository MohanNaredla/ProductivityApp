import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'package:productivity/pages/bottom_navigation.dart';
import 'package:productivity/utils/device/device_utils.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushReplacement(
          PageTransition(
            child: const BottomNavigation(),
            type: PageTransitionType.rightToLeftWithFade,
            duration: const Duration(milliseconds: 500),
            reverseDuration: const Duration(milliseconds: 300),
          ),
        );
      },
      child: Container(
        height: 60,
        width: DeviceUtils.getWidth(context) * 0.85,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(16),
        ),
        child: const Center(
          child: Text(
            "Login",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
