import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/utils/assets.dart';
import 'custom_stack_image.dart';

class Page1ViewBody extends StatelessWidget {
  const Page1ViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CustomStackImage(
          text: "nature",
          image: AppAssets.onBoarding1,
        ),
      ],
    );
  }
}
