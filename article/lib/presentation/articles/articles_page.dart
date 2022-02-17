import 'package:article/presentation/article_detail/article_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'articles_cubit.dart';

class ArticleList extends StatelessWidget {
  const ArticleList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ArticlesCubit>.value(
      value: context.read<ArticlesCubit>()..getArticlesRequested(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Articles')),
        body: BlocListener<ArticlesCubit, ArticlesState>(
          listener: (context, state) {},
          child: BlocBuilder<ArticlesCubit, ArticlesState>(
            buildWhen: (prev, cur) {
              return prev.status != cur.status || prev.articles != cur.articles;
            },
            builder: (context, state) {
              final status = state.status;
              final articles = state.articles;

              return status.maybeMap(
                orElse: () => Container(),
                busy: (_) => const LinearProgressIndicator(),
                idle: (_) => ListView.builder(
                  itemCount: articles.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(articles[index].title ?? ''),
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
