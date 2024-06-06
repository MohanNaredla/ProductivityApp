import 'package:flutter/material.dart';

import 'package:hive_flutter/hive_flutter.dart';
import "package:provider/provider.dart";
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:productivity/pages/splash_screen.dart';
import 'package:productivity/providers/task_provider.dart';
import 'package:productivity/providers/timer_provider.dart';
import 'package:productivity/utils/constants/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //Init Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  //Init Hive
  await Hive.initFlutter();

  //Open Hive Box
  // ignore: unused_local_variable
  var box = Hive.openBox("TodoBox");

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => TaskProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => TimerProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.background_light,
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
            surfaceTintColor: Colors.transparent,
            backgroundColor: Color.fromRGBO(254, 254, 254, 0.0),
            elevation: 0,
          ),
          iconButtonTheme: const IconButtonThemeData(
            style: ButtonStyle(
              iconColor: WidgetStatePropertyAll(
                Color.fromRGBO(0, 0, 0, 0.8),
              ),
              iconSize: WidgetStatePropertyAll(26),
              padding: WidgetStatePropertyAll(
                EdgeInsets.only(bottom: 1),
              ),
            ),
          ),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: const Color.fromRGBO(0, 0, 0, 0.8),
            foregroundColor: Colors.white,
            elevation: 6,
            enableFeedback: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(70),
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              backgroundColor: const WidgetStatePropertyAll(
                Color.fromRGBO(6, 7, 11, 0.827),
              ),
              foregroundColor: const WidgetStatePropertyAll(
                Colors.white,
              ),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ),
        themeMode: ThemeMode.light,
        home: const SplashScreen(),
      ),
    );
  }
}
