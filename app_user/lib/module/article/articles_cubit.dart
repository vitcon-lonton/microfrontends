import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/kt.dart';
import 'package:logger/logger.dart';
import 'article_api.dart';
part 'articles_cubit.freezed.dart';

@freezed
class ArticlesState with _$ArticlesState {
  const ArticlesState._();
  factory ArticlesState(
      {@Default(1) page,
      @Default(10) perPage,
      @Default(1) pageCount,
      @Default(0) totalCount,
      @Default(false) bool isLoading,
      required Option<KtList<Article>> articlesOption}) = _ArticlesState;
  factory ArticlesState.init() => ArticlesState(articlesOption: none());

  bool get isLastPage => page == pageCount;

  KtList<Article> get articles => articlesOption.getOrElse(emptyList);
}

class ArticlesCubit extends Cubit<ArticlesState> {
  final Logger _logger;
  final ArticleApi _articleApi;

  ArticlesCubit(this._logger, this._articleApi) : super(ArticlesState.init());

  void refreshRequested() => emit(ArticlesState.init());

  void pageNumberChanged(int value) => emit(state.copyWith(page: value));

  Future<void> getArticlesRequested() async {
    emit(state.copyWith(isLoading: true));

    Option<KtList<Article>> possibleData = await _performGetArticles();

    possibleData.fold(() {}, (articles) {
      emit(state.copyWith(
          articlesOption: optionOf(state.articles.plus(articles))));
    });

    emit(state.copyWith(isLoading: false));
  }

  Future<Option<KtList<Article>>> _performGetArticles() async {
    try {
      final response = await _articleApi.all();
      return optionOf(KtList.from(response.data!));
    } catch (e) {
      _logger.e(e);
    }

    return none();
  }
}
