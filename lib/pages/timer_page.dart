import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:productivity/components/AppComponents/empty_text.dart';
import 'package:productivity/components/AppComponents/select_time.dart';

class TimerPage extends StatefulWidget {
  const TimerPage({super.key});

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  void createDialog() {
    showCupertinoModalPopup(
      context: context,
      builder: (_) => const SelectTime(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(top: 14),
          child: Text(
            "Timer",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 32,
            ),
          ),
        ),
      ),
      body: const EmptyText(
        text: "Get Started By Creating a Timer By Clicking on The Button Below",
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 12, right: 10),
        child: FloatingActionButton(
          onPressed: createDialog,
          child: const Icon(
            FontAwesomeIcons.plus,
            size: 22,
            color: Color.fromRGBO(255, 255, 255, 0.8),
          ),
        ),
      ),
    );
  }
}
