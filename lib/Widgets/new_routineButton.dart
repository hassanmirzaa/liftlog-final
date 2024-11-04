import 'package:flutter/material.dart';

class NewRoutineButton extends StatelessWidget {
  final VoidCallback onPress;

  const NewRoutineButton({super.key, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      child: const Text('Start New Routine'),
    );
  }
}
