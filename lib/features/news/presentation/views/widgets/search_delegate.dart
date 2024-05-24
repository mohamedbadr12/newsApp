import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../../../core/api/dio_consumer.dart';
import '../../../../../core/app_router/route.dart';
import '../../../data/data_source/news_remote_data_source.dart';
import '../../../data/model/news_model.dart';
import '../../../data/repository/news_repository.dart';
import 'home_news_sliver_grid_container.dart';

class Search extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
          showSuggestions(context);
        },
        icon: const Icon(Icons.close),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final newsRepository = NewsRepository(
      remoteDataSource: NewsRemoteDataSource(DioConsumer(Dio())),
    );

    return FutureBuilder<Either<String, NewsModel>>(
      future: newsRepository.getNewsSearch(query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          return snapshot.data!.fold(
            (failure) => Center(child: Text(failure)),
            (newsModel) {
              final articles = newsModel.articles;
              if (articles.isEmpty) {
                return const Center(child: Text('No Data Found'));
              }
              return GridView.builder(
                itemCount: articles.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.6,
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        Routes.homeNewsDetails,
                        arguments: {"article": articles[index]},
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: HomeNewsSliverGridContainer(
                        date: articles[index].publishedAt,
                        image: articles[index].urlToImage,
                        title: articles[index].title,
                      ),
                    ),
                  );
                },
              );
            },
          );
        } else {
          return const Center(child: Text('No Data Found'));
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Center(child: Text('Search Article'));
  }
}
