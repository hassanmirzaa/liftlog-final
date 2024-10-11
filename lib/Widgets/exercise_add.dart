import 'package:flutter/material.dart';
import 'package:liftlog/Widgets/square_button.dart';

class AddExerciseButton extends StatefulWidget {
  final VoidCallback? onPress;
  const AddExerciseButton({super.key, this.onPress});

  @override
  State<AddExerciseButton> createState() => _AddExerciseButtonState();
}

class _AddExerciseButtonState extends State<AddExerciseButton> {
  @override
  Widget build(BuildContext context) {
    return SquareButton(
        widthSize: 0.3, heading: "+ Add Exercise", heightSize: 0.1,
        onPress: widget.onPress,
        );
  }
}
