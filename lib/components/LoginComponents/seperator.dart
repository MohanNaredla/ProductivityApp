import 'package:flutter/material.dart';
import 'package:productivity/utils/constants/colors.dart';

class Seperator extends StatelessWidget {
  const Seperator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Divider(
              color: AppColors.background_dark,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Text("OR"),
          ),
          Expanded(
            child: Divider(
              color: AppColors.background_dark,
            ),
          ),
        ],
      ),
    );
  }
}
