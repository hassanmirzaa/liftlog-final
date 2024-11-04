import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:liftlog/Auth/loginpage.dart';
import 'package:liftlog/Settings/settings_screen.dart';
import 'package:liftlog/Tutorials/tutorials.dart';
import 'package:liftlog/colors.dart';

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({super.key});

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  int currentstate = 0;
  final List<Widget> screens = const [
    LoginScreen(),
    TutorialsScreen(),
    SettingsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          IndexedStack(
            index: currentstate,
            children: screens,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(15.0), // Adjust padding as needed
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25), // Adjust border radius as needed
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.11,
                    color: Colors.grey.withOpacity(0.6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildNavItem(Icons.home_rounded, 'Home', 0),
                        _buildNavItem(Icons.video_library, 'Tutorials', 1),
                        _buildNavItem(AntDesign.setting_outline, 'Settings', 2),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          currentstate = index;
          debugPrint(currentstate.toString());
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: currentstate == index ? AppColor.PrimaryColor : null,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: currentstate == index
                      ? AppColor.ThemeColor
                      : AppColor.BackgroundColor, 
                  size: 39,
                ),
                if (currentstate == index)
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 18,
                      color: currentstate == index
                          ? AppColor.ThemeColor
                          : AppColor.PrimaryColor,
                      fontWeight: FontWeight.w800,
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
