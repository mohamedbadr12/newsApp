import 'package:flutter/material.dart';
import 'package:news_app/core/utils/assets.dart';

import 'custom_stack_image.dart';

class Page2ViewBody extends StatelessWidget {
  const Page2ViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return
      const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomStackImage(
            text: "space",
            image: AppAssets.onBoarding2,
          ),

        ],
      );
  }
}
