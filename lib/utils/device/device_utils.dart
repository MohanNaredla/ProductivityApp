import 'package:flutter/material.dart';

class DeviceUtils {
  DeviceUtils._();

  //Height and width of the screen
  static double getHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double getWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
}
