import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../data/model/news_model.dart';
import 'home_news_detail_article_description.dart';
import 'home_news_detail_article_detail.dart';
import 'home_news_details_image.dart';

class HomeNewsDetailsBody extends StatelessWidget {
  const HomeNewsDetailsBody({super.key, required this.articles});

  final Articles articles;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      SliverToBoxAdapter(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                HomeNewsDetailsImage(
                  image: articles.urlToImage,
                ),
                HomeNewsDetailArticleDetail(
                    date: articles.publishedAt,
                    author: articles.author,
                    title: articles.title),
                HomeNewsDetailArticleDescription(
                  description: articles.description,
                )
              ],
            )
          ],
        ),
      ),
    ]);
  }
}
