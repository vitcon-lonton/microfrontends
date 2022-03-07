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
    final price = '${widget.favorite.price} vnd';

    return ListTile(
      onTap: () {},
      title: Text(name),
      subtitle: Text(price),
      minVerticalPadding: 32.0,
      visualDensity: const VisualDensity(vertical: 4),
      trailing: BlocBuilder<FavoritesCubit, FavoritesState>(
        buildWhen: (prev, cur) => prev.removingId != cur.removingId,
        builder: (context, state) {
          if (state.removingId == null) {
            return IconButton(
              onPressed: () {
                // context
                //     .read<FavoritesCubit>()
                //     .unlikeRequested(widget.favorite.id);

                _confirm(context);
              },
              icon: const Icon(Icons.favorite, color: Colors.red),
            );
          }

          if (state.removingId!.getOrCrash().compareTo(id.getOrCrash()) == 0) {
            return const IconButton(
                onPressed: null, icon: CircularProgressIndicator());
          }

          return const IconButton(
            onPressed: null,
            icon: Icon(Icons.favorite, color: Colors.red),
          );
        },
      ),
      leading: Container(
        width: 70,
        height: 70,
        child: const Icon(Icons.medical_services),
        decoration: BoxDecoration(
            border: Border.all(), borderRadius: BorderRadius.circular(6)),
      ),
    );
  }

  void _confirm(BuildContext context) {
    showDialog(
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
                          onPressed: () {
                            context
                                .read<FavoritesCubit>()
                                .unlikeRequested(widget.favorite.id);

                            Navigator.of(context).pop();
                          },
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
