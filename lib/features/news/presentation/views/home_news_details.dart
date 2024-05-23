import 'package:flutter/material.dart';
import 'package:news_app/features/news/presentation/views/widgets/home_news_details_body.dart';

import '../../data/model/news_model.dart';

class HomeNewsDetails extends StatelessWidget {
  const HomeNewsDetails({super.key, required this.articles});

  final Articles articles;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeNewsDetailsBody(
        articles: articles,
      ),
    );
  }
}
