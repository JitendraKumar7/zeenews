import 'package:equatable/equatable.dart';
import 'package:zeenews/modal/modal.dart';

abstract class ArticleState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ArticleLoading extends ArticleState {}

class ArticleInitial extends ArticleState {}

class ArticleLoaded extends ArticleState {
  final ArticleModal article;

  ArticleLoaded(this.article);

  @override
  List<Object> get props => [article];
}

class ArticleError extends ArticleState {
  final String error;

  ArticleError(this.error);
}
