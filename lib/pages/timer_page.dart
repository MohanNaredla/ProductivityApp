import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:productivity/components/AppComponents/app_bar_title.dart';
import 'package:productivity/components/AppComponents/empty_text.dart';
import 'package:productivity/components/AppComponents/select_time.dart';
import 'package:productivity/utils/constants/colors.dart';

class TimerPage extends StatefulWidget {
  const TimerPage({super.key});

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  void createDialog() {
    showModalBottomSheet(
      backgroundColor: AppColors.background_light,
      sheetAnimationStyle: AnimationStyle(
        duration: const Duration(
          milliseconds: 500,
        ),
        reverseDuration: const Duration(
          milliseconds: 500,
        ),
        curve: Curves.easeIn,
        reverseCurve: Curves.easeOut,
      ),
      context: context,
      builder: (_) => const SelectTime(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarTitle(title: "Timer"),
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
