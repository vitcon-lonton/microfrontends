part of 'services.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: getIt<FavoriteAllCubit>()..getAllRequested()),
      ],
      child: Scaffold(
        // BODY
        body: BlocBuilder<FavoriteAllCubit, FavoriteAllState>(
          buildWhen: (prev, cur) => prev.favorites != cur.favorites,
          builder: (context, state) => RefreshLoadmore(
              isLastPage: state.isLastPage,
              onRefresh: () async {
                context.read<FavoriteAllCubit>().refreshRequested();
                await context.read<FavoriteAllCubit>().getAllRequested();
              },
              onLoadmore: () async {
                final state = context.read<FavoriteAllCubit>().state;
                final currentPage = state.page;
                final totalPage = state.pageCount;
                final nextPage = currentPage + 1;

                if (nextPage > totalPage) return;

                context.read<FavoriteAllCubit>().pageNumberChanged(nextPage);

                await context.read<FavoriteAllCubit>().getAllRequested();
              },
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: state.favorites.size,
                separatorBuilder: (_, index) => kVSpaceM,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (_, index) {
                  return ServiceTile(
                      service: state.favorites[index].toService());
                },
                padding: const EdgeInsets.symmetric(
                    horizontal: kSpaceM, vertical: kSpaceM),
              ),
              noMoreWidget: Text('No more data, you are at the end',
                  style: TextStyle(color: Theme.of(context).disabledColor))),
        ),

        // APP BAR
        appBar: AppBar(title: Text(tr(LocaleKeys.txt_favorite_service))),
      ),
    );
  }
}
