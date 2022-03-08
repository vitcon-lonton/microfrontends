part of 'article.dart';

class Articles extends StatefulWidget {
  final bool isPagination;
  final EdgeInsets padding;
  final Axis scrollDirection;

  const Articles({
    Key? key,
    this.isPagination = true,
    this.scrollDirection = Axis.vertical,
    this.padding = const EdgeInsets.symmetric(horizontal: kSpaceM),
  }) : super(key: key);

  @override
  State<Articles> createState() => _ArticlesState();
}

class _ArticlesState extends State<Articles> {
  Future<void> _onRefresh() async {
    context.read<ArticlesCubit>().refreshRequested();
    await context.read<ArticlesCubit>().getArticlesRequested();
  }

  Future<void> _onLoadMore() async {
    final state = context.read<ArticlesCubit>().state;
    final currentPage = state.page;
    final nextPage = currentPage + 1;
    final totalPage = state.pageCount;

    if (nextPage > totalPage) return;

    context.read<ArticlesCubit>().pageNumberChanged(nextPage);
    await context.read<ArticlesCubit>().getArticlesRequested();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ArticlesCubit>(
      create: (context) =>
          context.read<ArticlesCubit>()..getArticlesRequested(),
      child: BlocBuilder<ArticlesCubit, ArticlesState>(
        buildWhen: (prev, cur) => prev.articles != cur.articles,
        builder: (context, state) {
          final articles = state.articles;

          if (!widget.isPagination) {
            return ListView.separated(
              padding: widget.padding,
              itemCount: articles.length,
              separatorBuilder: (_, i) => kHSpaceM,
              scrollDirection: widget.scrollDirection,
              itemBuilder: (context, index) {
                return SizedBox(
                  width: 130,
                  height: 90,
                  child: ArticleTile(article: articles[index]),
                );
              },
            );
          }

          return RefreshLoadmore(
            onRefresh: _onRefresh,
            onLoadmore: _onLoadMore,
            isLastPage: state.isLastPage,
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: articles.length,
              scrollDirection: widget.scrollDirection,
              separatorBuilder: (_, index) => kVSpaceM,
              physics: const NeverScrollableScrollPhysics(),
              padding: widget.padding,
              itemBuilder: (_, index) {
                return SizedBox(
                  height: 180,
                  width: double.infinity,
                  child: ArticleTile(
                    article: articles[index],
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}


// final status = state.status;
// final articles = state.articles;

// return status.maybeMap(
//   orElse: () => Container(),
//   busy: (_) => const LinearProgressIndicator(),
//   idle: (_) => ListView.builder(
//     itemCount: articles.length,
//     itemBuilder: (context, index) {
//       return ListTile(
//         title: Text(articles[index].title ?? ''),
//         onTap: () => Navigator.of(context).push(
//           MaterialPageRoute(builder: (_) {
//             return ArticleDetail(article: articles[index]);
//           }),
//         ),
//       );
//     },
//   ),
// );