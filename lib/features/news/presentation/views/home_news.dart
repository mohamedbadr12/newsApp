import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/api/dio_consumer.dart';
import 'package:news_app/features/news/data/data_source/news_remote_data_source.dart';
import 'package:news_app/features/news/data/repository/news_repository.dart';
import 'package:news_app/features/news/presentation/views/widgets/home_news_body.dart';
import 'package:news_app/features/news/presentation/views/widgets/home_news_sliver_grid_container.dart';
import '../../../../core/app_router/route.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/styles.dart';
import '../../data/model/news_model.dart';

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
// return Builder(
//   builder: (_) {
//     if (query == '') {
//       return BlocBuilder<HomeNewsCubit, HomeNewsState>(
//           builder: (context, state) {
//             if (state is HomeNewsSearchLoading) {
//               return const Center(child: CircularProgressIndicator());
//             }
//             if (state is HomeNewsSearchSuccess) {
//               final articles = state.newsModel.articles;
//               return SliverGrid.builder(
//                 itemCount: articles.length,
//                 gridDelegate:
//                     const SliverGridDelegateWithFixedCrossAxisCount(
//                         childAspectRatio: 0.6,
//                         crossAxisCount: 2,
//                         crossAxisSpacing: 10,
//                         mainAxisSpacing: 10),
//                 itemBuilder: (context, index) {
//                   return InkWell(
//                     onTap: () {
//                       Navigator.pushNamed(context, Routes.homeNewsDetails,
//                           arguments: {"article": articles[index]});
//                     },
//                     child: HomeNewsSliverGridContainer(
//                       date: state.newsModel.articles[index].publishedAt,
//                       image: state.newsModel.articles[index].urlToImage,
//                       title: state.newsModel.articles[index].title,
//                     ),
//                   );
//                 },
//               );
//             }
//             if (state is HomeNewsSearchFailure) {
//               return Text(state.errorMessage);
//             } else {
//               return const Center(child: Text("Something went wrong"));
//             }
//           });
//     } else {
//       return BlocBuilder<HomeNewsCubit, HomeNewsState>(
//           builder: (context, state) {
//         if (state is HomeNewsSearchLoading) {
//           return const Center(child: CircularProgressIndicator());
//         }
//         if (state is HomeNewsSearchSuccess) {
//           final articles = state.newsModel.articles;
//           return SliverGrid.builder(
//             itemCount: articles.length,
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 childAspectRatio: 0.6,
//                 crossAxisCount: 2,
//                 crossAxisSpacing: 10,
//                 mainAxisSpacing: 10),
//             itemBuilder: (context, index) {
//               return InkWell(
//                 onTap: () {
//                   Navigator.pushNamed(context, Routes.homeNewsDetails,
//                       arguments: {"article": articles[index]});
//                 },
//                 child: HomeNewsSliverGridContainer(
//                   date: state.newsModel.articles[index].publishedAt,
//                   image: state.newsModel.articles[index].urlToImage,
//                   title: state.newsModel.articles[index].title,
//                 ),
//               );
//             },
//           );
//         }
//         if (state is HomeNewsSearchFailure) {
//           return Text(state.errorMessage);
//         } else {
//           return const Text("Something went wrong");
//         }
//       });
//     }
//   },
// );
