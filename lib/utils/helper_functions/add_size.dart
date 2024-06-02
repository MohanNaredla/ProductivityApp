import 'package:flutter/material.dart';

class AddSize {
  AddSize._();

  static Widget addVertical(height) {
    return SizedBox(
      height: height,
    );
  }

  static Widget addhorizontal(width) {
    return SizedBox(
      height: width,
    );
  }
}
