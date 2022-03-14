part of 'password_forget.dart';

class PasswordForgetPage extends StatelessWidget {
  const PasswordForgetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final txtForgotPassword = tr(LocaleKeys.txt_forgot_password);

    return BlocProvider<PasswordForgetCubit>(
      create: (_) => getIt<PasswordForgetCubit>(),
      child: BlocListener<PasswordForgetCubit, PasswordForgetState>(
        listenWhen: (prev, cur) =>
            prev.failureOrSuccessOption != cur.failureOrSuccessOption,
        listener: (context, state) {
          state.failureOrSuccessOption.fold(
            () {},
            (either) => either.fold(
              (failure) {
                const snackBar = SnackBar(
                  behavior: SnackBarBehavior.floating,
                  content: Text('Server error, please try again'),
                  // action: SnackBarAction(label: 'Action', onPressed: () {}),
                );

                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              (_) {
                const snackBar = SnackBar(
                  content: Text('Success'),
                  behavior: SnackBarBehavior.floating,
                );

                ScaffoldMessenger.of(context).showSnackBar(snackBar);

                // Navigator.of(context).pushNamed('routeName');
                // AutoRouter.of(context).replace(const NotesOverviewPageRoute());
              },
            ),
          );
        },
        child: Scaffold(
          appBar: AppBar(title: Text(txtForgotPassword)),
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: kSpaceM),
            child: Column(
              children: const [
                kVSpaceXL,
                kVSpaceXL,
                PasswordForgetForm(),
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
