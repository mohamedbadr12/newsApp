import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_colors.dart';

import '../../../../../core/utils/styles.dart';

class CategoryContainer extends StatelessWidget {
  const CategoryContainer(
      {super.key, required this.title, required this.image});

  final String title, image;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(fit: BoxFit.cover, image: AssetImage(image))),
      child: Align(
          alignment: Alignment.bottomCenter,
          child: Text(
            title,
            style: Styles.textStyle18SemiBold(context)
                .copyWith(color: AppColors.homeNewsColor),
          )),
    );
  }
}
