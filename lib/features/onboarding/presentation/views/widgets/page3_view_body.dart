import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';

import 'custom_stack_image.dart';

class Page3ViewBody extends StatelessWidget {
  const Page3ViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CustomStackImage(
          text: "fun",
          image: AppAssets.onBoarding3,
        ),
      ],
    );
  }
}
