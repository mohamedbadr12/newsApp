import 'package:flutter/material.dart';
import 'package:news_app/features/news/presentation/views/widgets/home_news_body.dart';
import 'package:news_app/features/news/presentation/views/widgets/search_delegate.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/styles.dart';

class HomeNews extends StatelessWidget {
  final String title;

  const HomeNews({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: Search());
            },
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
          )
        ],
        backgroundColor: AppColors.homeNewsColor,
        title: Text(title, style: Styles.textStyle18SemiBold(context)),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: HomeNewsBody(
            title: title,
          )),
    );
  }
}
