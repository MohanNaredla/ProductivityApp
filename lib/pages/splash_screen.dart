import 'dart:async';

import 'package:flutter/material.dart';
import 'package:productivity/pages/login_page.dart';
import 'package:productivity/utils/helper_functions/custom_page_route.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> iconAnimation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    iconAnimation = Tween<double>(begin: 0.67, end: 0.96).animate(_controller);
    _controller.repeat(reverse: true);

    //Navigating to another page
    Future.delayed(
      const Duration(seconds: 2),
      () {
        Navigator.of(context).pushReplacement(
          CustomPageRoute(
            page: const LoginPage(),
          ),
        );
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..scale(
                  iconAnimation.value,
                ),
              child: const Icon(
                Icons.work_rounded,
                size: 76,
              ),
            );
          },
        ),
      ),
    );
  }
}
