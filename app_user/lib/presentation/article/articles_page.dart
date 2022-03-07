import 'package:article/article.dart' hide Articles;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:app_user/injection.dart';

import 'articles.dart';

class ArticlesPage extends StatefulWidget {
  const ArticlesPage({Key? key}) : super(key: key);

  @override
  State<ArticlesPage> createState() => _ArticlesPageState();
}

class _ArticlesPageState extends State<ArticlesPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ArticlesCubit>(
      create: (context) => getIt<ArticlesCubit>(),
      child: Scaffold(
          appBar: AppBar(title: const Text('Articles')),
          body: const Articles()),
    );
  }
}
