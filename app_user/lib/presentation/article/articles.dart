import 'package:article/article.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:refresh_loadmore/refresh_loadmore.dart';
import 'package:theme_manager/theme_manager.dart';
import 'package:app_user/presentation/routes/router.gr.dart';
import 'article_tile.dart';

class Articles extends StatefulWidget {
  final bool isPagination;
  final Axis scrollDirection;

  const Articles({
    Key? key,
    this.isPagination = true,
    this.scrollDirection = Axis.vertical,
  }) : super(key: key);

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
      child: BlocBuilder<ArticlesCubit, ArticlesState>(
        buildWhen: (prev, cur) => prev.articles != cur.articles,
        builder: (context, state) {
          final articles = state.articles;

          if (!widget.isPagination) {
            return ListView.separated(
              itemCount: articles.length,
              scrollDirection: widget.scrollDirection,
              separatorBuilder: (_, i) => kSpaceZero,
              itemBuilder: (context, index) {
                final article = articles[index];
                final name = article.title ?? '';

                return InkWell(
                  onTap: () {
                    context.router
                        .push(ArticleDetailPageRoute(article: article));
                  },
                  child: SizedBox.square(
                    dimension: 130,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.category_outlined),
                        kVSpaceM,
                        Text(
                          name,
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }

          return RefreshLoadmore(
            onRefresh: _onRefresh,
            onLoadmore: _onLoadMore,
            isLastPage: state.isLastPage,
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: articles.length,
              scrollDirection: widget.scrollDirection,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (_, index) => const Divider(height: 0),
              itemBuilder: (_, index) => ArticleTile(
                article: articles[index],
                onTap: () {
                  context.router
                      .push(ArticleDetailPageRoute(article: articles[index]));
                },
              ),
            ),
          );
        },
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