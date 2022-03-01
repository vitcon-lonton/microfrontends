import 'package:article/presentation/article_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refresh_loadmore/refresh_loadmore.dart';
import 'package:theme_manager/theme_manager.dart';

import 'package:article/article.dart';

class ArticleList extends StatefulWidget {
  const ArticleList({Key? key}) : super(key: key);

  @override
  State<ArticleList> createState() => _ArticleListState();
}

class _ArticleListState extends State<ArticleList> {
  Future<void> _onRefresh() async {
    context.read<ArticlesCubit>().refreshRequested();
    await context.read<ArticlesCubit>().getArticlesRequested();
  }

  Future<void> _onLoadMore() async {
    final state = context.read<ArticlesCubit>().state;
    final currentPage = state.page;
    final totalPage = state.pageCount;
    final nextPage = currentPage + 1;

    if (nextPage > totalPage) return;

    context.read<ArticlesCubit>().pageNumberChanged(nextPage);
    await context.read<ArticlesCubit>().getArticlesRequested();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ArticlesCubit>(
      create: (context) =>
          context.read<ArticlesCubit>()..getArticlesRequested(),
      child: BlocListener<ArticlesCubit, ArticlesState>(
        listener: (context, state) {},
        child: WScaffold(
          appBar: const WAppBar(
              backgroundColor: Colors.white, title: Text('Wish List')),
          body: BlocBuilder<ArticlesCubit, ArticlesState>(
            buildWhen: (prev, cur) => prev.articles != cur.articles,
            builder: (context, state) {
              final articles = state.articles;

              return RefreshLoadmore(
                onRefresh: _onRefresh,
                onLoadmore: _onLoadMore,
                isLastPage: state.isLastPage,
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: articles.length,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (_, index) => const Divider(height: 0),
                  itemBuilder: (_, index) {
                    return ArticleTile(
                      article: articles[index],
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) {
                          return ArticleDetail(article: articles[index]);
                        }),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}


// final status = state.status;
// final articles = state.articles;

// return status.maybeMap(
//   orElse: () => Container(),
//   busy: (_) => const LinearProgressIndicator(),
//   idle: (_) => ListView.builder(
//     itemCount: articles.length,
//     itemBuilder: (context, index) {
//       return ListTile(
//         title: Text(articles[index].title ?? ''),
//         onTap: () => Navigator.of(context).push(
//           MaterialPageRoute(builder: (_) {
//             return ArticleDetail(article: articles[index]);
//           }),
//         ),
//       );
//     },
//   ),
// );