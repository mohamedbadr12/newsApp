import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../../../core/utils/styles.dart';
import 'category_gridview.dart';

class CategoryViewBody extends StatelessWidget {
  const CategoryViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      const SliverToBoxAdapter(
        child: SizedBox(
          height: 30,
        ),
      ),
      SliverToBoxAdapter(
        child: Text(
          "Pick your Category \n Of Interest :",
          style: Styles.textStyle22SemiBold(context),
        ),
      ),
      const SliverToBoxAdapter(
        child: SizedBox(
          height: 20,
        ),
      ),
      const CategoryGridView()
    ]);
  }
}
