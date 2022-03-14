part of 'article.dart';

class ArticleDetailPage extends StatelessWidget {
  final Article article;

  const ArticleDetailPage({
    Key? key,
    required this.article,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final txtBlogs = tr(LocaleKeys.txt_blogs);
    final content = article.content;

    return Scaffold(
        appBar: AppBar(title: Text(txtBlogs)), body: Html(data: content));

    // return Scaffold(appBar: AppBar(), body: const Text('Not found content'));
  }
}
