import 'package:flutter/material.dart';
import 'package:productivity/utils/helper_functions/add_size.dart';

class TimerButtons extends StatelessWidget {
  const TimerButtons({
    super.key,
    required this.text1,
    required this.text2,
    required this.topColor,
    required this.bottomColor,
  });

  final String text1;
  final String text2;
  final Color topColor;
  final Color bottomColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 60.0),
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(
                topColor,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                text1,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          AddSize.addVertical(24.0),
          ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(
                bottomColor,
              ),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: const BorderSide(
                    color: Colors.black,
                    width: 2.0,
                  ),
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                text2,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
