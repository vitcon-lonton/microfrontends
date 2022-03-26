// ignore_for_file: unused_element
part of 'services.dart';

class FavoriteButton extends StatefulWidget {
  final int serviceId;

  const FavoriteButton({Key? key, required this.serviceId}) : super(key: key);

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  @override
  Widget build(BuildContext context) {
    final serviceId = widget.serviceId;

    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: getIt<FavoriteDeleteCubit>()),
        BlocProvider.value(value: getIt<FavoriteCreateCubit>()),
        BlocProvider(create: (context) {
          final authState = context.read<AuthBloc>().state;
          final isAuthenticated = authState.maybeWhen(
              orElse: () => false, authenticated: () => true);

          if (!isAuthenticated) {
            return getIt<FavoriteFindCubit>();
          }

          return getIt<FavoriteFindCubit>()..findRequested(serviceId);
        }),
      ],
      child: MultiBlocListener(
        listeners: [
          // LISTEN CREATE
          BlocListener<FavoriteCreateCubit, FavoriteCreateState>(
            listener: (context, state) => state.whenOrNull(
                createSuccess: () =>
                    context.read<FavoriteFindCubit>().findRequested(serviceId),
                createFailure: (failure) => ScaffoldMessenger.of(context)
                    .showSnackBar(
                        const SnackBar(content: Text('Unexpected error.')))),
          ),

          // LISTEN DELETE
          BlocListener<FavoriteDeleteCubit, FavoriteDeleteState>(
            listener: (context, state) => state.whenOrNull(
                deleteSuccess: () =>
                    context.read<FavoriteFindCubit>().findRequested(serviceId),
                deleteFailure: (failure) => ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(
                        content: Text(
                            'Unexpected error occurred while deleting.')))),
          ),
        ],
        child: BlocBuilder<FavoriteFindCubit, FavoriteFindState>(
            builder: (context, state) {
          return state.maybeWhen(actionInProgress: () {
            return const IconButton(
                onPressed: null,
                icon: CircularProgressIndicator(strokeWidth: 2.0));
          }, founded: (serviceId) {
            return IconButton(
                onPressed: () =>
                    context.read<FavoriteDeleteCubit>().deleted(serviceId),
                icon: const Icon(Icons.favorite));
          }, orElse: () {
            return IconButton(
                onPressed: () =>
                    context.read<FavoriteCreateCubit>().created(serviceId),
                icon: const Icon(Icons.favorite_border_outlined));
          });
        }),
      ),
    );
  }

  // Future<void> _onPressedLike() {
  //   return context.read<FavoriteCreateCubit>().created(widget.favorite.id);
  // }

  // Future<void> _onPressedUnlike() async {
  //   final isAccepted = await _confirm();
  //   if (isAccepted != true) return;
  //   return context.read<FavoriteDeleteCubit>().deleted(widget.favorite.id);
  // }

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
                  Text('Are you want unlike ${widget.serviceId}?'),
                  // Text('Are you want unlike ${widget.favorite.name}?'),
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
