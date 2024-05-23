import 'dart:async';
import 'package:flutter/material.dart';
import 'package:news_app/features/news/presentation/views/widgets/cutom_container_pageview.dart';
import '../../../../../core/utils/assets.dart';
import '../../../data/model/pageview_news_model.dart';

class CustomNewsPageView extends StatefulWidget {
  const CustomNewsPageView({super.key});

  @override
  _CustomNewsPageViewState createState() => _CustomNewsPageViewState();
}

class _CustomNewsPageViewState extends State<CustomNewsPageView> {
  late PageController _pageController;
  late Timer _timer;
  int _currentPage = 0;

  List<PageViewNewsModel> pageViewList = [
    const PageViewNewsModel(image: AppAssets.onBoarding1, title: "NATURE"),
    const PageViewNewsModel(
        image: AppAssets.categoryBusiness, title: "Business"),
    const PageViewNewsModel(image: AppAssets.categoryScience, title: "Science"),
    const PageViewNewsModel(
        image: AppAssets.categoryEntertainment, title: "ENTERTAINMENT"),
    const PageViewNewsModel(image: AppAssets.categoryHealth, title: "Health"),
    const PageViewNewsModel(
        image: AppAssets.categoryTechnology, title: "Technology"),
    const PageViewNewsModel(image: AppAssets.onBoarding2, title: "ASTRONAUT"),
    const PageViewNewsModel(image: AppAssets.categorySports, title: "Sports"),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentPage < pageViewList.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
      ),
      child: PageView.builder(
        controller: _pageController,
        physics: const BouncingScrollPhysics(),
        itemCount: pageViewList.length,
        itemBuilder: (context, index) {
          return CustomContainerPageView(
            image: pageViewList[index].image,
            title: pageViewList[index].title,
          );
        },
      ),
    );
  }
}
