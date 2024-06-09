import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:productivity/components/AppComponents/app_bar_title.dart';
import 'package:productivity/components/AppComponents/settings_tile.dart';
import 'package:productivity/utils/helper_functions/add_size.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    List data = [
      {
        'title': "Notifications",
        'icon': CupertinoIcons.bell,
        'onTap': () {},
      },
      {
        'title': "Logout",
        'icon': CupertinoIcons.square_arrow_right,
        'onTap': () {
          FirebaseAuth.instance.signOut();
        },
      },
      {
        'title': "Sounds",
        'icon': CupertinoIcons.music_note,
        'onTap': () {},
      },
      {
        'title': "Privacy",
        'icon': CupertinoIcons.checkmark_shield,
        'onTap': () {},
      },
      {
        'title': "Clear Cache",
        'icon': CupertinoIcons.globe,
        'onTap': () {},
      },
      {
        'title': "FAQ",
        'icon': CupertinoIcons.question_circle,
        'onTap': () {},
      },
      {
        'title': "Data Privacy Terms",
        'icon': CupertinoIcons.doc,
        'onTap': () {},
      },
      {
        'title': "Terms and Conditions",
        'icon': CupertinoIcons.doc_on_doc,
        'onTap': () {},
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const AppBarTitle(title: "Settings"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 18.0,
            vertical: 29,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Card(
                color: const Color.fromRGBO(228, 228, 228, 1),
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ListTile(
                  iconColor: Colors.black,
                  titleTextStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                  subtitleTextStyle: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w300,
                    color: Colors.black,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  title: const Text("Leave Feedback"),
                  subtitle: const Text("Let us know how you like the app"),
                  leading: const Icon(CupertinoIcons.hand_thumbsup),
                ),
              ),
              AddSize.addVertical(40.0),
              ...data.map(
                (e) {
                  return SettingsTile(
                    icon: e['icon'] as IconData,
                    title: e['title'] as String,
                    onTap: e['onTap'] as void Function(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
