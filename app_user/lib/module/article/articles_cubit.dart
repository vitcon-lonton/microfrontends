import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';
import 'api.dart';
part 'articles_cubit.freezed.dart';

@freezed
class ArticlesState with _$ArticlesState {
  const ArticlesState._();

  factory ArticlesState({
    @Default(1) page,
    @Default(10) perPage,
    @Default(1) pageCount,
    @Default(0) totalCount,
    @Default(false) bool isSubmitting,
    @Default(true) bool showErrorMessages,
    required Option<List<Article>> articlesOption,
  }) = _ArticlesState;

  bool get isLastPage => page == pageCount;

  List<Article> get articles {
    return List.of(articlesOption
        .foldRight(<Article>[], (articles, previous) => articles));
  }

  factory ArticlesState.init() => ArticlesState(articlesOption: none());
}

class ArticlesCubit extends Cubit<ArticlesState> {
  final Logger _logger;
  final ArticleApi _api;

  ArticlesCubit(this._logger, this._api) : super(ArticlesState.init());

  void refreshRequested() => emit(ArticlesState.init());

  void pageNumberChanged(int value) => emit(state.copyWith(page: value));

  Future<void> getArticlesRequested() async {
    emit(state.copyWith(isSubmitting: true));

    final result = await _getArticles();

    result.fold(() {}, (articles) {
      final newArticles = state.articles
        ..addAll(articles)
        ..addAll(articles)
        ..addAll(articles)
        ..addAll(articles);

      emit(state.copyWith(articlesOption: optionOf(newArticles)));
    });

    emit(state.copyWith(isSubmitting: false));
  }

  Future<Option<List<Article>>> _getArticles() async {
    try {
      final response = await _api.getArticles();
      if (response.valid) return optionOf(response.data);
    } catch (e) {
      _logger.e(e);
    }

    return none();
  }
}
