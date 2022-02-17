import 'package:article/article.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class ArticleDetail extends StatelessWidget {
  final Article article;

  const ArticleDetail({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final content = article.content;
    final title = article.title ?? '';

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Html(data: content),
    );
  }
}
