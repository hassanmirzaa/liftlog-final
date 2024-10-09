import 'package:flutter/material.dart';

class NutrientIndicator extends StatelessWidget {
  final String label;
  final String value;
  final Color color;

  const NutrientIndicator({
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(color: Colors.grey),
        ),
        SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
              color: color, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}