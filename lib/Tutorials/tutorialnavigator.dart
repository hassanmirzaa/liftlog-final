import 'package:flutter/material.dart';
import 'package:liftlog/Tutorials/Custompageroute.dart';
import 'package:liftlog/Tutorials/tutorials.dart';

class TutorialsNavigator extends StatelessWidget {
  const TutorialsNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (RouteSettings settings) {
        return CustomPageRoute(
          page: const TutorialsScreen(),
          duration: const Duration(seconds: 15), // Custom hero animation duration
        );
      },
    );
  }
}




