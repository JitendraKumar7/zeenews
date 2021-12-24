import 'package:equatable/equatable.dart';

abstract class ArticleEvent extends Equatable {
  const ArticleEvent();
}

class FetchArticle extends ArticleEvent {
  const FetchArticle();

  @override
  List<Object> get props => [];
}
