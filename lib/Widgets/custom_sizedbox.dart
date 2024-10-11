import 'package:flutter/material.dart';

class CustomSizedBox extends StatelessWidget {
  final double x;
  const CustomSizedBox({super.key, required this.x});

  @override
  Widget build(BuildContext context) {
    final Height = MediaQuery.of(context).size.height;
    final Width = MediaQuery.of(context).size.width;
    return   SizedBox(
              height: Height * x,
            );
  }
}