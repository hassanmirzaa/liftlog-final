import 'package:flutter/material.dart';
import 'package:liftlog/colors.dart';

class NewRoutineButton extends StatefulWidget {
  final VoidCallback? onPress;
  const NewRoutineButton({super.key, this.onPress});

  @override
  State<NewRoutineButton> createState() => _NewRoutineButtonState();
}

class _NewRoutineButtonState extends State<NewRoutineButton> {
  
  @override
  Widget build(BuildContext context) {
    final Height = MediaQuery.of(context).size.height;
    final Width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: widget.onPress,
      child: Container(
        height: Height*0.2,
        width: Width*0.5,
        decoration: BoxDecoration(
          color: AppColor.ThemeColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.assignment_outlined,
                size: 50,
                color: Colors.white,
              ),
              Text(
                "New Routine",
                style: TextStyle(color: Colors.white, fontSize: 25),
              )
            ],
          ),
        ),
      ),
    );
  }
}
