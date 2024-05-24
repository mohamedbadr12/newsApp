import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:news_app/features/news/presentation/manger/home_news_cubit.dart';

import '../../features/news/data/data_source/news_remote_data_source.dart';
import '../../features/news/data/repository/news_repository.dart';
import '../api/dio_consumer.dart';

final sl = GetIt.instance;

class ServicesLocator {
  static void init() {
    sl.registerLazySingleton<HomeNewsCubit>(() => HomeNewsCubit(sl()));
    sl.registerLazySingleton<NewsRepository>(
        () => NewsRepository(remoteDataSource: sl()));
    sl.registerLazySingleton<NewsRemoteDataSource>(
        () => NewsRemoteDataSource(sl()));
    sl.registerLazySingleton<DioConsumer>(() => DioConsumer(sl()));
    sl.registerLazySingleton<Dio>(() => Dio());
  }
}
