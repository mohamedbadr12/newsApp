import 'package:flutter/material.dart';

class CustomContainerSingleDot extends StatelessWidget {
  const CustomContainerSingleDot({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 11,
      height: 11,
      decoration: const ShapeDecoration(
        color: Color(0xFF4E4E4E),
        shape: OvalBorder(),
      ),
    );
  }
}
