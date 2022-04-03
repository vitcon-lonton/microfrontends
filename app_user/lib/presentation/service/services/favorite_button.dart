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
        BlocProvider.value(
          value: context.read<AuthBloc>().state.maybeWhen(orElse: () {
            return getIt<FavoriteFindCubit>();
          }, authenticated: (user) {
            return getIt<FavoriteFindCubit>()..findRequested(serviceId);
          }),
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          // LISTEN AUTHENTICATION
          BlocListener<AuthBloc, AuthState>(listener: (context, state) {
            state.whenOrNull(authenticated: (user) {
              return context.read<FavoriteFindCubit>().findRequested(serviceId);
            });
          }),

          // LISTEN CREATE
          BlocListener<FavoriteCreateCubit, FavoriteCreateState>(
            listener: (context, state) => state.whenOrNull(createSuccess: () {
              return context.read<FavoriteStorageCubit>().push(serviceId);
            }, createFailure: (failure) {
              return ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Unexpected error.')));
            }),
          ),

          // LISTEN DELETE
          BlocListener<FavoriteDeleteCubit, FavoriteDeleteState>(
            listener: (context, state) => state.whenOrNull(deleteSuccess: () {
              return context.read<FavoriteStorageCubit>().remove(serviceId);
            }, deleteFailure: (failure) {
              return ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Unexpected error occurred while deleting.')));
            }),
          ),

          // LISTEN FIND
          BlocListener<FavoriteDeleteCubit, FavoriteDeleteState>(
            listener: (context, state) => state.whenOrNull(deleteSuccess: () {
              return context.read<FavoriteStorageCubit>().remove(serviceId);
            }, deleteFailure: (failure) {
              return ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Unexpected error occurred while deleting.')));
            }),
          ),
          BlocListener<FavoriteFindCubit, FavoriteFindState>(
            listener: (context, state) => state.whenOrNull(founded: (id) {
              return context.read<FavoriteStorageCubit>().push(serviceId);
            }),
          ),
        ],
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return state.maybeMap(orElse: () {
              return IconButton(
                  onPressed: () {
                    context.router.push(const SignInPageRoute());
                  },
                  icon: const Icon(Icons.favorite_border_outlined));
            }, authenticated: (user) {
              return BlocBuilder<FavoriteFindCubit, FavoriteFindState>(
                  builder: (context, state) {
                return state.maybeWhen(actionInProgress: () {
                  return const IconButton(
                      onPressed: null,
                      icon: CircularProgressIndicator(strokeWidth: 2.0));
                }, orElse: () {
                  return BlocBuilder<FavoriteStorageCubit,
                      FavoriteStorageState>(
                    buildWhen: (prev, cur) => prev.ids != cur.ids,
                    builder: (context, state) {
                      if (state.ids.contains(serviceId)) {
                        return IconButton(
                            onPressed: () => context
                                .read<FavoriteDeleteCubit>()
                                .deleted(serviceId),
                            icon: const Icon(Icons.favorite));
                      }

                      return IconButton(
                          onPressed: () => context
                              .read<FavoriteCreateCubit>()
                              .created(serviceId),
                          icon: const Icon(Icons.favorite_border_outlined));
                    },
                  );
                });
              });

              // return BlocBuilder<FavoriteFindCubit, FavoriteFindState>(
              //     builder: (context, state) {
              //   return state.maybeWhen(actionInProgress: () {
              //     return const IconButton(
              //         onPressed: null,
              //         icon: CircularProgressIndicator(strokeWidth: 2.0));
              //   }, founded: (serviceId) {
              //     return IconButton(
              //         onPressed: () => context
              //             .read<FavoriteDeleteCubit>()
              //             .deleted(serviceId),
              //         icon: const Icon(Icons.favorite));
              //   }, orElse: () {
              //     return IconButton(
              //         onPressed: () => context
              //             .read<FavoriteCreateCubit>()
              //             .created(serviceId),
              //         icon: const Icon(Icons.favorite_border_outlined));
              //   });
              // });
            });
          },
        ),
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
