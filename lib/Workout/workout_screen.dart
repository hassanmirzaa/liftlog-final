import 'package:flutter/material.dart';
import 'package:liftlog/Widgets/exercise_add.dart';
import 'package:liftlog/Widgets/new_routine_button.dart';
import 'package:liftlog/Widgets/select_exercise.dart';
class WorkoutScreen extends StatefulWidget {
  const WorkoutScreen({super.key});

  @override
  State<WorkoutScreen> createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  bool showNewRoutine = true;
  String? selectedExercise;
  
  String searchQuery = ''; // State variable for the search query
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>(); // Form key for validation

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Workouts'),
      ),
      body:
      showNewRoutine ?
        Center(
        child: NewRoutineButton(
          onPress: (){
            setState(() {
              showNewRoutine = false;
            });
          },
        )
      ) : Padding(
        padding: const EdgeInsets.all(8.0),
        child: ExerciseList(
          
        ),
      ) 
      
       
    );
  }
}
