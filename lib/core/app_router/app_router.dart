import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/api/dio_consumer.dart';
import 'package:news_app/core/app_router/route.dart';
import 'package:news_app/features/news/data/data_source/news_remote_data_source.dart';
import 'package:news_app/features/news/data/repository/news_repository.dart';
import 'package:news_app/features/news/presentation/manger/home_news_cubit.dart';
import 'package:news_app/features/news/presentation/views/home_news.dart';
import 'package:news_app/features/onboarding/presentation/views/onboarding_pageview.dart';
import '../../features/news/presentation/views/category_view.dart';
import '../../features/news/presentation/views/home_news_details.dart';

abstract class AppRouter {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (context) {
          return const Text('data');
        });
      case Routes.onBoarding:
        return MaterialPageRoute(builder: (context) {
          return const OnBoardingPageView();
        });
      case Routes.homeNews:
        return MaterialPageRoute(builder: (context) {
          final arguments = settings.arguments as Map;
          return BlocProvider(
            create: (context) => HomeNewsCubit(NewsRepository(
                remoteDataSource: NewsRemoteDataSource(DioConsumer(Dio())))),
            child: HomeNews(
              title: arguments['title'],
            ),
          );
        });
      case Routes.category:
        return MaterialPageRoute(builder: (context) {
          return const CategoryView();
        });
      case Routes.homeNewsDetails:
        return MaterialPageRoute(builder: (context) {
          final arguments = settings.arguments as Map;
          return HomeNewsDetails(
              articles: arguments['article']); // HomeNewsDetails(articles:);
        });
    }
    return null;
  }
}
