import 'package:article/data/data.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class ArticleDetailPage extends StatelessWidget {
  const ArticleDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final article = Article.fromJson(context.routeData.meta);
    final content = article.content;
    final title = article.title ?? '';

    return Scaffold(
      body: Html(data: content),
      appBar: AppBar(title: Text(title)),
    );

    // return Scaffold(appBar: AppBar(), body: const Text('Not found content'));
  }
}
