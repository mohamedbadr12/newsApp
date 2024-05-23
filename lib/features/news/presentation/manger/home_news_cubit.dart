import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app/features/news/data/model/news_model.dart';
import 'package:news_app/features/news/data/repository/news_repository.dart';

part 'home_news_state.dart';

class HomeNewsCubit extends Cubit<HomeNewsState> {
  HomeNewsCubit(this.news) : super(HomeNewsInitial());
  final NewsRepository news;
  List<Articles> articles = [];

  Future getNews(String searchEverything) async {
    emit(HomeNewsLoading());
    final response = await news.getNewsEverything(searchEverything);
    response.fold(
        (errorMessage) => emit(HomeNewsFailure(errorMessage: errorMessage)),
        (newModel) {
      articles = newModel.articles;
      emit(HomeNewsSuccess(newsModel: newModel));
    });
  }

  Future getNewsSearch(String search) async {
    emit(HomeNewsSearchLoading());
    final response = await news.getNewsSearch(search);
    response.fold(
        (errorMessage) =>
            emit(HomeNewsSearchFailure(errorMessage: errorMessage)),
        (newModel) => emit(HomeNewsSearchSuccess(newsModel: newModel)));
  }
}
