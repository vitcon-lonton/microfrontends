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
                final message = failure.maybeWhen(
                    orElse: () => 'Unable update password',
                    unableUpdatePassword: (errors) => errors.join(', '));

                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(message)));
              },
              (_) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Success'),
                    behavior: SnackBarBehavior.floating));
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
