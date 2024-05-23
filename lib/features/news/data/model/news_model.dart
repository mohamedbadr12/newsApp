import 'package:equatable/equatable.dart';

class NewsModel extends Equatable {
  final String status;
  final int totalResults;
  final List<Articles> articles;

  const NewsModel({
    this.status = 'unknown',
    this.totalResults = 0,
    this.articles = const [],
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      status: json['status'] ?? 'unknown',
      totalResults: json['totalResults'] ?? 0,
      articles: json['articles'] != null
          ? (json['articles'] as List).map((v) => Articles.fromJson(v)).toList()
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'totalResults': totalResults,
      'articles': articles.map((v) => v.toJson()).toList(),
    };
  }

  @override
  List<Object?> get props => [status, totalResults, articles];
}

class Articles extends Equatable {
  final Source source;
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;

  const Articles({
    this.source = const Source(),
    this.author = 'Unknown',
    this.title = 'No title',
    this.description = 'No description',
    this.url = '',
    this.urlToImage = '',
    this.publishedAt = 'Unknown date',
    this.content = 'No content available',
  });

  factory Articles.fromJson(Map<String, dynamic> json) {
    return Articles(
      source: json['source'] != null
          ? Source.fromJson(json['source'])
          : const Source(),
      author: json['author'] ?? 'Unknown',
      title: json['title'] ?? 'No title',
      description: json['description'] ?? 'No description',
      url: json['url'] ?? '',
      urlToImage: json['urlToImage'] ??
          'https://t3.ftcdn.net/jpg/00/36/94/26/360_F_36942622_9SUXpSuE5JlfxLFKB1jHu5Z07eVIWQ2W.jpg',
      publishedAt: json['publishedAt'] ?? 'Unknown date',
      content: json['content'] ?? 'No content available',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'source': source.toJson(),
      'author': author,
      'title': title,
      'description': description,
      'url': url,
      'urlToImage': urlToImage,
      'publishedAt': publishedAt,
      'content': content,
    };
  }

  @override
  List<Object?> get props => [
        source,
        author,
        title,
        description,
        url,
        urlToImage,
        publishedAt,
        content
      ];
}

class Source extends Equatable {
  final String id;
  final String name;

  const Source({this.id = 'unknown', this.name = 'unknown'});

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      id: json['id'] ?? 'unknown',
      name: json['name'] ?? 'unknown',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }

  @override
  List<Object?> get props => [id, name];
}
