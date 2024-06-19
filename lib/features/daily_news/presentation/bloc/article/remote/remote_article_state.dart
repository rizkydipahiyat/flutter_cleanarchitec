import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:my_ca/features/daily_news/domain/entities/article.dart';

abstract class RemoteArticleState extends Equatable {
  final List<ArticleEntity>? articles;
  final DioException? error;

  const RemoteArticleState({this.articles, this.error});

  @override
  List<Object> get props => [articles!, error!];
}

// first case -> when we request the server and wait for the server to return the data, in this case we must show loading
class RemoteArticlesLoading extends RemoteArticleState {
  const RemoteArticlesLoading();
}

// 2nd case -> when the data has been recived and we have to display it
class RemoteArticlesDone extends RemoteArticleState {
  const RemoteArticlesDone(List<ArticleEntity> article)
      : super(articles: article);
}

// last case -> when we have a problem in receiving data from the server
class RemoteArticlesError extends RemoteArticleState {
  const RemoteArticlesError(DioException error) : super(error: error);
}
