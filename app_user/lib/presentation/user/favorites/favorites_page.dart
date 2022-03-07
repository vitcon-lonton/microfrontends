// ignore_for_file: unused_element

part of 'favorites.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  Future<void> _onRefresh() async {
    context.read<FavoritesCubit>().refreshRequested();
    await context.read<FavoritesCubit>().getFavoritesRequested();
  }

  Future<void> _onLoadMore() async {
    final state = context.read<FavoritesCubit>().state;
    final currentPage = state.page;
    final totalPage = state.pageCount;
    final nextPage = currentPage + 1;

    if (nextPage > totalPage) return;

    context.read<FavoritesCubit>().pageNumberChanged(nextPage);
    await context.read<FavoritesCubit>().getFavoritesRequested();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FavoritesCubit>(
      create: (context) => getIt<FavoritesCubit>()..getFavoritesRequested(),
      child: BlocListener<FavoritesCubit, FavoritesState>(
        listener: (context, state) {},
        child: Scaffold(
          appBar: AppBar(title: const Text('Wish List')),
          body: BlocBuilder<FavoritesCubit, FavoritesState>(
            buildWhen: (prev, cur) =>
                prev.favorites != cur.favorites ||
                prev.removingId != cur.removingId,
            builder: (context, state) {
              final favorites = state.favorites;

              return RefreshLoadmore(
                // onRefresh: _onRefresh,
                // onLoadmore: _onLoadMore,
                onRefresh: () async {
                  context.read<FavoritesCubit>().refreshRequested();
                  await context.read<FavoritesCubit>().getFavoritesRequested();
                },
                onLoadmore: () async {
                  final state = context.read<FavoritesCubit>().state;
                  final currentPage = state.page;
                  final totalPage = state.pageCount;
                  final nextPage = currentPage + 1;

                  if (nextPage > totalPage) return;

                  context.read<FavoritesCubit>().pageNumberChanged(nextPage);
                  await context.read<FavoritesCubit>().getFavoritesRequested();
                },
                isLastPage: state.isLastPage,
                noMoreWidget: Text('No more data, you are at the end',
                    style: TextStyle(color: Theme.of(context).disabledColor)),
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: favorites.length,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (_, index) => const Divider(height: 0),
                  itemBuilder: (_, index) {
                    return FavoriteTile(favorite: favorites[index]);
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
