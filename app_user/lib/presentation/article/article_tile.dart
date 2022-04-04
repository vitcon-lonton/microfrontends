part of 'article.dart';

class ArticleTile extends StatelessWidget {
  final Article article;
  final BorderRadius? borderRadius;

  const ArticleTile({
    Key? key,
    required this.article,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final image = article.image;
    final title = article.title;

    return InkWell(
      borderRadius: borderRadius ?? BorderRadius.circular(2),
      onTap: () {
        context.router.push(ArticleDetailPageRoute(article: article));
      },
      child: Ink(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: borderRadius ?? BorderRadius.circular(2)),
                  child: image == null
                      ? const Icon(Icons.article_outlined, size: 40)
                      : DMQImage.network(image, fit: BoxFit.cover)),
            ),
            kVSpaceXS,
            if (title != null) ...[
              Text(title,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis),
            ],
            kVSpaceXS,
          ],
        ),
      ),
    );

    // return ListTile(onTap: onTap, title: Text(title));
  }
}
