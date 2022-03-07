import 'package:article/data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class ArticleDetailPage extends StatelessWidget {
  final Article article;

  const ArticleDetailPage({
    Key? key,
    required this.article,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final content = article.content;
    final title = article.title ?? '';

    return Scaffold(
      body: Html(data: content),
      appBar: AppBar(title: Text(title)),
    );

    // return Scaffold(appBar: AppBar(), body: const Text('Not found content'));
  }
}
