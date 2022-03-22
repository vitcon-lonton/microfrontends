part of 'favorites.dart';

class FavoriteTile extends StatefulWidget {
  final Favorite favorite;

  const FavoriteTile({Key? key, required this.favorite}) : super(key: key);

  @override
  State<FavoriteTile> createState() => _FavoriteTileState();
}

class _FavoriteTileState extends State<FavoriteTile> {
  bool isLiked = true;

  @override
  Widget build(BuildContext context) {
    final favorite = widget.favorite;
    final id = favorite.id;
    final name = favorite.name;
    final priceApprox = favorite.priceApprox;
    final priceText = priceApprox == null ? 'Contact' : '$priceApprox vnd';

    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: () => context.router.push(ServiceBookingPageRoute(serviceId: id)),
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
                    child: Icon(Icons.medical_services,
                        size: 60, color: Theme.of(context).primaryColor))),
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
                        Text(priceText,
                            maxLines: 1,
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(fontSize: 16))
                      ],
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start)),
            ),
            IconTheme(
              data: const IconThemeData.fallback()
                  .copyWith(color: Theme.of(context).primaryColor),
              child: BlocBuilder<FavoriteAllCubit, FavoriteAllState>(
                buildWhen: (prev, cur) => prev.removingId != cur.removingId,
                builder: (context, state) {
                  final removingId = state.removingId;

                  if (id == removingId) {
                    return const IconButton(
                        onPressed: null, icon: CircularProgressIndicator());
                  }

                  if (isLiked) {
                    return IconButton(
                        onPressed: _onPressedUnlike,
                        icon: const Icon(Icons.favorite));
                  }

                  return IconButton(
                      onPressed: _onPressedLike,
                      icon: const Icon(Icons.favorite_border_outlined));
                },
              ),
            )
          ]),
        ),
      ),
    );
  }

  Future<void> _onPressedLike() {
    return context.read<FavoriteCreateCubit>().created(widget.favorite.id);
  }

  Future<void> _onPressedUnlike() async {
    final isAccepted = await _confirm();
    if (isAccepted != true) return;
    setState(() => isLiked = false);
    return context.read<FavoriteDeleteCubit>().deleted(widget.favorite.id);
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
