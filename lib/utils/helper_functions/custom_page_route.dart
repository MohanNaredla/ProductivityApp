import "package:flutter/material.dart";

class CustomPageRoute extends PageRouteBuilder {
  final Widget page;
  CustomPageRoute({
    required this.page,
  }) : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          transitionDuration: const Duration(milliseconds: 350),
          reverseTransitionDuration: const Duration(milliseconds: 100),
        );

  @override
  Color get barrierColor => Colors.transparent;

  @override
  bool get opaque => false;
}
