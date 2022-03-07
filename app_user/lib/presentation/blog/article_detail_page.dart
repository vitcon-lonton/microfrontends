import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:theme_manager/theme_manager.dart';

import 'package:article/data/data.dart';

class ArticleDetail extends StatelessWidget {
  final Article article;

  const ArticleDetail({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final content = article.content;
    final title = article.title ?? '';

    return WScaffold(
      body: Html(data: content),
      appBar: AppBar(title: Text(title)),
    );
  }
}
