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
    final title = article.title ?? '';

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
                child: const Icon(Icons.article_outlined, size: 40),
                decoration: BoxDecoration(
                  borderRadius: borderRadius ?? BorderRadius.circular(2),
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            kVSpaceXS,
            Text(
              title,
              maxLines: 2,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
            kVSpaceXS,
          ],
        ),
      ),
    );

    // return ListTile(onTap: onTap, title: Text(title));
  }
}
