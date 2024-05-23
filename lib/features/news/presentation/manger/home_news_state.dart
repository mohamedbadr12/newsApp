part of 'home_news_cubit.dart';

abstract class HomeNewsState extends Equatable {
  const HomeNewsState();

  @override
  List<Object> get props => [];
}

class HomeNewsInitial extends HomeNewsState {}

class HomeNewsLoading extends HomeNewsState {}

class HomeNewsSuccess extends HomeNewsState {
  final NewsModel newsModel;

  const HomeNewsSuccess({
    required this.newsModel,
  });
}

class HomeNewsFailure extends HomeNewsState {
  final String errorMessage;

  const HomeNewsFailure({
    required this.errorMessage,
  });

}

class HomeNewsSearchLoading extends HomeNewsState {}

class HomeNewsSearchSuccess extends HomeNewsState {
  final NewsModel newsModel;

  const HomeNewsSearchSuccess({
    required this.newsModel,
  });
}

class HomeNewsSearchFailure extends HomeNewsState {
  final String errorMessage;

  const HomeNewsSearchFailure({
    required this.errorMessage,
  });

}