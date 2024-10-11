import 'package:flutter/material.dart';
import 'package:liftlog/colors.dart';

class SquareButton extends StatelessWidget {
  final double widthSize;
  final double heightSize;
  final VoidCallback? onPress;
  final String heading;
  const SquareButton({
    super.key,
    required this.widthSize,
    this.onPress,
    required this.heading, required this.heightSize, 
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onPress,
      child: Container(
        height: height * heightSize,
        width: width * widthSize,
        decoration: BoxDecoration(
          color: AppColor.ThemeColor, 
          borderRadius: BorderRadius.circular(8.0), 
        ),
        alignment: Alignment.center,
        child: Text(
          heading,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16.0, 
            fontWeight: FontWeight.bold, 
          ),
        ),
      ),
    );
  }
}
