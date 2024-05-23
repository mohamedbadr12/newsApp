import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/news/presentation/manger/home_news_cubit.dart';
import 'package:news_app/features/news/presentation/views/widgets/custom_news_pageview.dart';
import 'package:news_app/features/news/presentation/views/widgets/home_news_sliver_grid_container.dart';

import '../../../../../core/app_router/route.dart';
import '../../../../../core/utils/styles.dart';

class HomeNewsBody extends StatefulWidget {
  const HomeNewsBody({super.key, required this.title});

  final String title;

  @override
  State<HomeNewsBody> createState() => _HomeNewsBodyState();
}

class _HomeNewsBodyState extends State<HomeNewsBody> {
  @override
  void initState() {
    context.read<HomeNewsCubit>().getNews(widget.title);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 20,
          ),
        ),
        const SliverToBoxAdapter(child: CustomNewsPageView()),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 40,
          ),
        ),
        SliverToBoxAdapter(
          child: Text(
            'Recommended Article',
            style: Styles.textStyle14Bold(context),
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 20,
          ),
        ),
        BlocBuilder<HomeNewsCubit, HomeNewsState>(
          builder: (context, state) {
            if (state is HomeNewsLoading) {
              return const SliverToBoxAdapter(
                  child: Center(child: CircularProgressIndicator()));
            }
            if (state is HomeNewsSuccess) {
              return SliverGrid.builder(
                itemCount: state.newsModel.articles.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.6,
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.homeNewsDetails,
                          arguments: {
                            "article": state.newsModel.articles[index]
                          });
                    },
                    child: HomeNewsSliverGridContainer(
                      date: state.newsModel.articles[index].publishedAt,
                      image: state.newsModel.articles[index].urlToImage,
                      title: state.newsModel.articles[index].title,
                    ),
                  );
                },
              );
            }
            if (state is HomeNewsFailure) {
              return SliverToBoxAdapter(child: Text(state.errorMessage));
            } else {
              return const SliverToBoxAdapter(
                  child: Text("Something went wrong"));
            }
          },
        )
      ],
    ));
  }
}
