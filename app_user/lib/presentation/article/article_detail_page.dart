part of 'article.dart';

class ArticleDetailPage extends StatelessWidget {
  final Article article;

  const ArticleDetailPage({
    Key? key,
    required this.article,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = article.title;
    final content = article.content;

    return Scaffold(
      body: Html(data: content),
      appBar: AppBar(title: title == null ? kSpaceZero : Text(title)),
    );

    // return Scaffold(appBar: AppBar(), body: const Text('Not found content'));
  }
}
