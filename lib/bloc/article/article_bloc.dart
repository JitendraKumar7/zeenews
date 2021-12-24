import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zeenews/repository/repository.dart';

import 'event/article_event.dart';
import 'state/article_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  final ApiRepository repository;

  ArticleBloc(this.repository)
      : super(ArticleInitial()) {
    on<FetchArticle>(_onChangeEvent);
  }

  void fetchArticle() {
    add(const FetchArticle());
  }

  void _onChangeEvent(ArticleEvent event, Emitter<ArticleState> emit) async {
    if (event is FetchArticle) {
      emit(ArticleLoading());
      try {
        final article = await repository.fetchArticles();
        emit(ArticleLoaded(article));
      } catch (e) {
        emit(ArticleError(e.toString()));
      }
    }
  }
}
