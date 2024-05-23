import 'package:flutter/material.dart';
import 'custon_container_single_dot.dart';

class CustomRowDotIndicator extends StatelessWidget {
  const CustomRowDotIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        SizedBox(
          width: 20,
        ),
        CustomContainerSingleDot(),
        SizedBox(
          width: 10,
        ),
        CustomContainerSingleDot(),
        SizedBox(
          width: 10,
        ),
        CustomContainerSingleDot(),
      ],
    );
  }
}
