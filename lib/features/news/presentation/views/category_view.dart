import 'package:flutter/material.dart';
import 'package:news_app/core/utils/styles.dart';
import 'package:news_app/features/news/presentation/views/widgets/category_view_body.dart';

import '../../../../core/utils/app_colors.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.homeNewsColor,
        title: Text("News App", style: Styles.textStyle18SemiBold(context)),
      ),
      body: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: CategoryViewBody()),
    );
  }
}
