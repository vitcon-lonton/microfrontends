part of 'article.dart';

class ArticleDetailPage extends StatelessWidget {
  final Article article;

  const ArticleDetailPage({
    Key? key,
    required this.article,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final image = article.image;
    final content = article.content;
    final txtBlogs = tr(LocaleKeys.txt_blogs);

    return Scaffold(
      // BODY
      body: ListView(children: [
        if (image != null) ...[
          DMQImage.network(image, fit: BoxFit.cover),
          kVSpaceM,
        ],
        Html(data: content),
        kVSpaceM,
      ]),

      // APP BAR
      appBar: AppBar(title: Text(txtBlogs)),
    );

    // return Scaffold(appBar: AppBar(), body: const Text('Not found content'));
  }
}
