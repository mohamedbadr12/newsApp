import 'package:news_app/core/api/api_consumer.dart';

import '../../../../core/api/end_point.dart';

class NewsRemoteDataSource {
  final ApiConsumer _api;

  NewsRemoteDataSource(this._api);

  Future<dynamic> getNewsSearch(String search) async {
    final response = await _api.get(EndPoint.newsEverything(search));
    return response;
  }

  Future<dynamic> getNewsEverything(String searchEverything) async {
    final response = await _api.get(EndPoint.newsEverything(searchEverything));
    return response;
  }
}
