part of 'user_update.dart';

class UserUpdatePage extends StatelessWidget {
  const UserUpdatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final txtUpdate = tr(LocaleKeys.txt_update);

    return BlocProvider<UserUpdateCubit>.value(
      value: getIt<UserUpdateCubit>(),
      child: MultiBlocListener(
        listeners: [
          BlocListener<UserUpdateCubit, UserUpdateState>(
            listenWhen: (prev, cur) =>
                prev.failureOrSuccessOption != cur.failureOrSuccessOption,
            listener: (context, state) {
              state.failureOrSuccessOption.fold(
                () {},
                (either) => either.fold(
                  (failure) {
                    // final snackBar = SnackBar(
                    //   behavior: SnackBarBehavior.floating,
                    //   content: Text(
                    //     failure.map(
                    //       cancelledByUser: (_) => 'Cancelled',
                    //       serverError: (_) => 'Server error',
                    //       emailAlreadyInUse: (_) => 'Email already in use',
                    //       invalidEmailAndPasswordCombination: (_) =>
                    //           'Invalid email and password combination',
                    //     ),
                    //   ),
                    //   action: SnackBarAction(label: 'Action', onPressed: () {}),
                    // );

                    // ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  (_) {
                    final snackBar = SnackBar(
                        content: const Text('Success'),
                        behavior: SnackBarBehavior.floating,
                        action:
                            SnackBarAction(label: 'Action', onPressed: () {}));

                    ScaffoldMessenger.of(context).showSnackBar(snackBar);

                    context.read<UserCubit>().getUserRequested();
                  },
                ),
              );
            },
          ),
        ],
        child: Scaffold(
          // APP_BAR
          appBar: AppBar(title: Text(txtUpdate)),

          // BODY
          body: SingleChildScrollView(
              child: Column(children: const [
                kVSpaceXL,
                UserUpdateForm(),
                kVSpaceL,
              ]),
              padding: const EdgeInsets.symmetric(horizontal: kSpaceM)),
        ),
      ),
    );
  }
}
