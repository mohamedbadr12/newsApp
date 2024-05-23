import 'package:dartz/dartz.dart';

import 'package:news_app/core/error/exception.dart';

import '../data_source/news_remote_data_source.dart';
import '../model/news_model.dart';

class NewsRepository {
  final NewsRemoteDataSource remoteDataSource;

  const NewsRepository({
    required this.remoteDataSource,
  });

  Future<Either<String, NewsModel>> getNewsSearch(String search) async {
    try {
      final response = await remoteDataSource.getNewsSearch(search);

      return Right(NewsModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    }
  }

  Future<Either<String, NewsModel>> getNewsEverything(
      String searchEverything) async {
    try {
      final response =
      await remoteDataSource.getNewsEverything(searchEverything);
      return Right(NewsModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errorModel.message);
    }
  }
}
