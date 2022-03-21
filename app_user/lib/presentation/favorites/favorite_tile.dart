part of 'favorites.dart';

class FavoriteTile extends StatefulWidget {
  final Favorite favorite;

  const FavoriteTile({Key? key, required this.favorite}) : super(key: key);

  @override
  State<FavoriteTile> createState() => _FavoriteTileState();
}

class _FavoriteTileState extends State<FavoriteTile> {
  @override
  Widget build(BuildContext context) {
    final id = widget.favorite.id;
    final name = widget.favorite.name;
    final price = '${widget.favorite.priceApprox} vnd';

    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: () => context.router.push(ServiceBookingPageRoute(serviceId: 1)),
      child: Ink(
        padding: const EdgeInsets.all(kSpaceS),
        decoration: BoxDecoration(
          color: const Color(0xFFF7F8FA),
          borderRadius: BorderRadius.circular(8),
        ),
        child: SizedBox.fromSize(
          size: const Size.fromHeight(60),
          child: Row(children: [
            SizedBox(
              width: 60,
              height: 60,
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 0.25),
                    borderRadius: BorderRadius.circular(2)),
                child: Icon(
                  Icons.medical_services,
                  size: 60,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            kHSpaceM,
            Expanded(
              flex: 2,
              child: DefaultTextStyle(
                  maxLines: 2,
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(fontSize: 14),
                  overflow: TextOverflow.ellipsis,
                  child: Column(
                      children: [
                        kVSpaceXS,
                        Text(name, maxLines: 2),
                        kVSpaceXS,
                        Text(price,
                            maxLines: 1,
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(fontSize: 16))
                      ],
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start)),
            ),
            BlocBuilder<FavoritesCubit, FavoritesState>(
              buildWhen: (prev, cur) => prev.removingId != cur.removingId,
              builder: (context, state) {
                final removingId = state.removingId;

                if (removingId == null) {
                  return IconButton(
                      onPressed: _onPressedUnlike,
                      icon: const Icon(Icons.favorite, color: Colors.red));
                }

                if (id == removingId) {
                  return const IconButton(
                      onPressed: null, icon: CircularProgressIndicator());
                }

                return const IconButton(
                  onPressed: null,
                  icon: Icon(Icons.favorite, color: Colors.red),
                );
              },
            )
          ]),
        ),
      ),
    );
  }

  Future<void> _onPressedUnlike() async {
    final res = await _confirm();

    if (res != true) return;

    return context.read<FavoritesCubit>().unlikeRequested(widget.favorite.id);
  }

  Future<bool?> _confirm() {
    return showDialog(
      context: context,
      builder: (context) => Material(
        color: Colors.transparent,
        child: Column(
          children: [
            const Spacer(),
            Container(
              color: Colors.white,
              margin: const EdgeInsets.symmetric(horizontal: kSpaceXXL),
              padding: const EdgeInsets.symmetric(
                  vertical: kSpaceXL, horizontal: kSpaceXXL),
              child: Column(
                children: [
                  kVSpaceL,
                  Text('Are you want unlike ${widget.favorite.name}?'),
                  kVSpaceXL,
                  kVSpaceXL,
                  Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          child: const Text('Cancel'),
                          onPressed: Navigator.of(context).pop,
                        ),
                      ),
                      kHSpaceL,
                      Expanded(
                        child: ElevatedButton(
                          child: const Text('Unlike'),
                          style: ElevatedButton.styleFrom(
                              elevation: 0, shadowColor: Colors.transparent),
                          onPressed: () => Navigator.of(context).pop(true),
                        ),
                      ),
                    ],
                  ),
                  kVSpaceL,
                ],
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
