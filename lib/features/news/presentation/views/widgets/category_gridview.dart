import 'package:flutter/material.dart';
import '../../../../../core/app_router/route.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../news/data/model/cateory_model.dart';
import 'category_container.dart';

class CategoryGridView extends StatelessWidget {
  const CategoryGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List category = [
      CategoryModel(title: 'business', image: AppAssets.categoryBusiness),
      CategoryModel(
          title: 'entertainment', image: AppAssets.categoryEntertainment),
      CategoryModel(title: 'health', image: AppAssets.categoryHealth),
      CategoryModel(title: 'science', image: AppAssets.categoryScience),
      CategoryModel(title: 'sports', image: AppAssets.categorySports),
      CategoryModel(title: 'technology', image: AppAssets.categoryTechnology),
    ];
    return SliverGrid.builder(
      itemCount: category.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.85,
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.pushNamed(context, Routes.homeNews,
                arguments: {'title': category[index].title});
          },
          child: CategoryContainer(
            title: category[index].title,
            image: category[index].image,
          ),
        );
      },
    );
  }
}
