import 'package:flutter/material.dart';
import 'package:news_app/features/onboarding/presentation/views/page1_view.dart';
import 'package:news_app/features/onboarding/presentation/views/page2_view.dart';
import 'package:news_app/features/onboarding/presentation/views/page3_view.dart';
import 'package:news_app/features/onboarding/presentation/views/widgets/custom_active_dot.dart';
import 'package:news_app/features/onboarding/presentation/views/widgets/custom_container_row_get_started.dart';
import 'package:news_app/features/onboarding/presentation/views/widgets/custon_container_single_dot.dart';

class OnBoardingPageView extends StatefulWidget {
  const OnBoardingPageView({super.key});

  @override
  State<OnBoardingPageView> createState() => _OnBoardingPageViewState();
}

class _OnBoardingPageViewState extends State<OnBoardingPageView> {
  PageController controller = PageController();
  int activePage = 0;
  List pages = [
    const Page1View(),
    const Page2View(),
    const Page3View(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverToBoxAdapter(
          child: Column(children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.8,
              child: PageView.builder(
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (value) {
                  setState(() {
                    activePage = value;
                  });
                },
                controller: controller,
                itemCount: pages.length,
                itemBuilder: (context, index) {
                  return pages[index];
                },
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 9,
                  width: 150,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: pages.length,
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: activePage == index
                              ? const CustomActiveDot()
                              : const CustomContainerSingleDot());
                    },
                  ),
                ),
                CustomContainerGetStarted(
                  con: controller,
                )
              ],
            )
          ]),
        ),
      ]),
    );
  }
}
