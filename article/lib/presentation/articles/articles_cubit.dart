import 'package:bloc/bloc.dart';
import 'package:engine/engine.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:article/article.dart';

part 'articles_cubit.freezed.dart';

@freezed
class ArticlesState with _$ArticlesState {
  const ArticlesState._();

  factory ArticlesState({
    @Default(true) bool showErrorMessages,
    @Default(<Article>[]) List<Article> articles,
    @Default(ProcessingStatus.idle()) ProcessingStatus status,
  }) = _ArticlesState;

  factory ArticlesState.init() => ArticlesState();

  ArticlesState busy() => copyWith(status: STATUS_BUSY);
  ArticlesState idle() => copyWith(status: STATUS_IDLE);
  ArticlesState failed() => copyWith(status: STATUS_FAILED);
  ArticlesState complete() {
    return copyWith(status: STATUS_COMPLETE);
  }
}

class ArticlesCubit extends Cubit<ArticlesState> {
  final ArticleApi _api;

  ArticlesCubit(this._api) : super(ArticlesState.init());

  getArticlesRequested() async {
    try {
      final response = await _api.getArticles();
      final data = response.data;

      if (response.valid) {
        return emit(state.idle().copyWith(articles: data ?? <Article>[]));
      }

      return emit(state.failed());
    } catch (e) {
      return emit(state.failed());
    }
  }
}
