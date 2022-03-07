import 'package:flutter/material.dart';
import 'package:article/data/data.dart';

class ArticleTile extends StatelessWidget {
  final Article article;
  final VoidCallback? onTap;

  const ArticleTile({
    Key? key,
    this.onTap,
    required this.article,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = article.title ?? '';

    return ListTile(onTap: onTap, title: Text(title));
  }
}
