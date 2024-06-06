import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconsax/iconsax.dart';

import 'package:productivity/pages/home_page.dart';
import 'package:productivity/pages/settings_page.dart';
import 'package:productivity/pages/timer_page.dart';
import 'package:productivity/pages/todo_page.dart';
import 'package:productivity/utils/constants/colors.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    ValueNotifier<int> index = ValueNotifier<int>(0);
    const List<Widget> widgetList = [
      HomePage(),
      TodoPage(),
      TimerPage(),
      SettingsPage()
    ];
    return Scaffold(
      bottomNavigationBar: Container(
        padding: const EdgeInsets.fromLTRB(24, 14, 14, 28),
        decoration: const BoxDecoration(
          color: Color.fromRGBO(228, 228, 228, 1),
        ),
        child: ValueListenableBuilder(
          valueListenable: index,
          builder: (context, value, child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    index.value = 0;
                  },
                  style: ButtonStyle(
                    iconColor: index.value == 0
                        ? const WidgetStatePropertyAll(
                            AppColors.secondary_color_variant,
                          )
                        : null,
                  ),
                  icon: const Icon(
                    Iconsax.home_21,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    index.value = 1;
                  },
                  style: ButtonStyle(
                    iconColor: index.value == 1
                        ? const WidgetStatePropertyAll(
                            AppColors.secondary_color_variant,
                          )
                        : null,
                  ),
                  icon: const Icon(
                    FontAwesomeIcons.list,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    index.value = 2;
                  },
                  style: ButtonStyle(
                    iconColor: index.value == 2
                        ? const WidgetStatePropertyAll(
                            AppColors.secondary_color_variant,
                          )
                        : null,
                  ),
                  icon: const Icon(
                    FontAwesomeIcons.solidClock,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    index.value = 3;
                  },
                  style: ButtonStyle(
                    iconColor: index.value == 3
                        ? const WidgetStatePropertyAll(
                            AppColors.secondary_color_variant,
                          )
                        : null,
                  ),
                  icon: const Icon(
                    FontAwesomeIcons.gear,
                  ),
                ),
              ],
            );
          },
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: index,
        builder: (context, value, child) => widgetList[index.value],
      ),
    );
  }
}
