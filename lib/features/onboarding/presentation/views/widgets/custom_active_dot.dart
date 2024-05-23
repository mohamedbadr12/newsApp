import 'package:flutter/material.dart';

class CustomActiveDot extends StatelessWidget {
  const CustomActiveDot({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 11,
      height: 11,
      decoration: const ShapeDecoration(
        color: Color(0xFFBEDE61),
        shape: OvalBorder(),
      ),
    );
  }
}
