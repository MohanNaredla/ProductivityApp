import 'package:flutter/cupertino.dart';

class EmptyText extends StatelessWidget {
  const EmptyText({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 104),
      child: Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
          softWrap: true,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
