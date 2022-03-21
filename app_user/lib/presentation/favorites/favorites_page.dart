part of 'favorites.dart';

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
        BlocProvider.value(value: getIt<FavoriteDeleteCubit>()),
        BlocProvider.value(value: getIt<FavoriteCreateCubit>()),
        BlocProvider.value(value: getIt<FavoriteAllCubit>()..getAllRequested()),
      ],
      child: MultiBlocListener(
        listeners: [
          // LISTEN CREATE
          BlocListener<FavoriteDeleteCubit, FavoriteDeleteState>(
              listener: (context, state) => state.mapOrNull(
                  deleteFailure: (state) => ScaffoldMessenger.of(context)
                      .showSnackBar(const SnackBar(
                          behavior: SnackBarBehavior.floating,
                          content: Text(
                              'Unexpected error occurred while deleting.'))))),

          // LISTEN DELETE
          BlocListener<FavoriteCreateCubit, FavoriteCreateState>(
              listener: (context, state) => state.mapOrNull(
                  createSuccess: (state) =>
                      context.read<FavoriteAllCubit>().getAllRequested(),
                  createFailure: (state) => ScaffoldMessenger.of(context)
                      .showSnackBar(const SnackBar(
                          behavior: SnackBarBehavior.floating,
                          content: Text('Unexpected error.'))))),
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
                    return FavoriteTile(favorite: state.favorites[index]);
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
      ),
    );
  }
}
