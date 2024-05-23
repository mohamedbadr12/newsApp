import 'package:flutter/material.dart';
import 'package:news_app/features/onboarding/presentation/views/widgets/page1_view_body.dart';

class Page1View extends StatelessWidget {
  const Page1View({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Page1ViewBody(),
    );
  }
}
