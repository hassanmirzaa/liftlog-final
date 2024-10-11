import 'package:flutter/material.dart';
import 'package:liftlog/Settings/settings_screen.dart';
import 'package:liftlog/Tutorials/tutorials.dart';
import 'package:liftlog/Workout/workout_screen.dart';
import 'package:liftlog/colors.dart';
import 'package:liftlog/Home/homepage_screen.dart';

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({super.key});

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  int currentstate=0;
  final List<Widget> screen=const[
    Homepage(),
    WorkoutScreen(),
    TutorialsScreen(),
    SettingsScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        height: MediaQuery.of(context).size.height*0.1,
        color: AppColor.ThemeColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: (){
                setState(() {
                  currentstate=0;
                  debugPrint(currentstate.toString());
                 
                });
              },
              child: Container(
                child: Column(
                  children: [
                    Icon(Icons.home_rounded,color: currentstate ==0 ?Colors.blue : Colors.white,size: 30,),
                    Text('Home',
                    style: TextStyle(
                      fontSize: 15,
                      color: currentstate ==0 ?Colors.blue : Colors.white),)
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: (){
                setState(() {
                  currentstate=1;
                  debugPrint(currentstate.toString());
                   
                });
              },
              child: Container(
                child: Column(
                  children: [
                    Icon(Icons.fitness_center_rounded,color: currentstate ==1 ?Colors.blue : Colors.white,size: 30,),
                    Text('Workout',
                    style: TextStyle(
                      fontSize: 15,
                      color: currentstate ==1 ?Colors.blue : Colors.white),)
                  ],
                ),
              ),
            ),
             InkWell(
              onTap: (){
                setState(() {
                  currentstate=2;
                  debugPrint(currentstate.toString());
                   
                });
              },
              child: Column(
                children: [
                  Icon(Icons.center_focus_strong_rounded,color: currentstate ==2 ?Colors.blue : Colors.white,size: 30,),
                  Text('Tutorials',
                  style: TextStyle(
                    fontSize: 15,color: currentstate ==2 ?Colors.blue : Colors.white),)
                ],
              ),
            ),
            InkWell(
              onTap: (){
                setState(() {
                  currentstate=3;
                  debugPrint(currentstate.toString());
                   
                });
              },
              child: Container(
                child: Column(
                  children: [
                    Icon(Icons.settings_sharp,color: currentstate ==3 ?Colors.blue : Colors.white,   size: 30,),
                    Text('Settings',
                    style: TextStyle(
                      fontSize: 15,
                      color: currentstate ==3 ?Colors.blue : Colors.white),)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      body: screen[currentstate],
    );
  }
}