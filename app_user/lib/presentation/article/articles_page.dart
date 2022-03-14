part of 'article.dart';

class ArticlesPage extends StatefulWidget {
  const ArticlesPage({Key? key}) : super(key: key);

  @override
  State<ArticlesPage> createState() => _ArticlesPageState();
}

class _ArticlesPageState extends State<ArticlesPage> {
  @override
  Widget build(BuildContext context) {
    final txtBlogs = tr(LocaleKeys.txt_blogs);

    return BlocProvider<ArticlesCubit>(
      create: (context) => getIt<ArticlesCubit>(),
      child: Scaffold(
        appBar: AppBar(title: Text(txtBlogs)),
        body: const Articles(
          padding: EdgeInsets.symmetric(horizontal: kSpaceM, vertical: kSpaceM),
        ),
      ),
    );
  }
}
