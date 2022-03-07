part of 'user_update.dart';

class UserUpdatePage extends StatelessWidget {
  const UserUpdatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const registerTxt = 'Update Profile';

    return BlocProvider<UserUpdateCubit>(
      create: (_) => context.read<UserUpdateCubit>(),
      child: BlocListener<UserUpdateCubit, UserUpdateState>(
        listenWhen: (prev, cur) {
          return prev.failureOrSuccessOption != cur.failureOrSuccessOption;
        },
        listener: (context, state) {
          state.failureOrSuccessOption.fold(
            () {},
            (either) => either.fold(
              (failure) {
                final snackBar = SnackBar(
                  behavior: SnackBarBehavior.floating,
                  content: Text(
                    failure.map(
                      cancelledByUser: (_) => 'Cancelled',
                      serverError: (_) => 'Server error',
                      emailAlreadyInUse: (_) => 'Email already in use',
                      invalidEmailAndPasswordCombination: (_) =>
                          'Invalid email and password combination',
                    ),
                  ),
                  action: SnackBarAction(label: 'Action', onPressed: () {}),
                );

                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              (_) {
                final snackBar = SnackBar(
                    content: const Text('Success'),
                    behavior: SnackBarBehavior.floating,
                    action: SnackBarAction(label: 'Action', onPressed: () {}));

                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
            ),
          );
        },
        child: WScaffold(
          appBar: const WAppBar(title: Text(registerTxt)),
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: kSpaceM),
            child: Column(
              children: const [
                kVSpaceXL,
                kVSpaceXL,
                UserUpdateForm(),
                kVSpaceXL,
                kVSpaceL,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
