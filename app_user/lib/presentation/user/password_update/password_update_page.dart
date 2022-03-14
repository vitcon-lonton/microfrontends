part of 'password_update.dart';

class PasswordUpdatePage extends StatelessWidget {
  const PasswordUpdatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final txtUpdate = tr(LocaleKeys.txt_update);
    final txtPassword = tr(LocaleKeys.txt_password).toLowerCase();
    final txtTitle = '$txtUpdate $txtPassword';

    return BlocProvider<PasswordUpdateCubit>(
      create: (_) => getIt<PasswordUpdateCubit>(),
      child: BlocListener<PasswordUpdateCubit, PasswordUpdateState>(
        listenWhen: (prev, cur) =>
            prev.failureOrSuccessOption != cur.failureOrSuccessOption,
        listener: (context, state) {
          state.failureOrSuccessOption.fold(
            () {},
            (either) => either.fold(
              (failure) {
                final snackBar = SnackBar(
                  behavior: SnackBarBehavior.floating,
                  content: const Text('Server error'),
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
        child: Scaffold(
          appBar: AppBar(title: Text(txtTitle)),
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: kSpaceM),
            child: Column(
              children: const [
                kVSpaceXL,
                kVSpaceXL,
                PasswordUpdateForm(),
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
