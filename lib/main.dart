import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:liftlog/SplashScreen/splashScreen.dart';
import 'package:liftlog/colors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xffFAF9F6),
        bottomAppBarTheme: const BottomAppBarTheme(),
        appBarTheme: AppBarTheme(
          backgroundColor: AppColor.ThemeColor,
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
      ),
    );
  }
}
