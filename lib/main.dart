import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/utils/dependency_injection.dart';
import 'core/app_router/app_router.dart';
import 'core/app_router/route.dart';

void main() {
  ServicesLocator.init();
  runApp(DevicePreview(
    enabled: false,
    builder: (context) => const NewsApp(),
  ));
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRouter.generateRoute,
        initialRoute: Routes.onBoarding,
        theme:
            ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.black));
  }
}
