import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refresh_loadmore/refresh_loadmore.dart';
import 'package:theme_manager/theme_manager.dart';

import 'article_detail_page.dart';
import 'article_tile.dart';
import 'articles_cubit.dart';

class Articles extends StatefulWidget {
  const Articles({Key? key}) : super(key: key);

  @override
  State<Articles> createState() => _ArticlesState();
}

class _ArticlesState extends State<Articles> {
  Future<void> _onRefresh() async {
    context.read<ArticlesCubit>().refreshRequested();
    await context.read<ArticlesCubit>().getArticlesRequested();
  }

  Future<void> _onLoadMore() async {
    final state = context.read<ArticlesCubit>().state;
    final currentPage = state.page;
    final nextPage = currentPage + 1;
    final totalPage = state.pageCount;

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
        child: Scaffold(
          appBar: AppBar(title: const Text('Articles')),
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
                  itemBuilder: (_, index) => ArticleTile(
                    article: articles[index],
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) {
                        return ArticleDetail(article: articles[index]);
                      }),
                    ),
                  ),
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