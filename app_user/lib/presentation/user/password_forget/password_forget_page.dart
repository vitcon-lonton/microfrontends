part of 'password_forget.dart';

class PasswordForgetPage extends StatelessWidget {
  const PasswordForgetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const registerTxt = 'Forget Password';
    // final msgTerm1 = tr(LocaleKeys.msg_term1);
    // final msgTerm2 = tr(LocaleKeys.msg_term2);
    // final msgTerm3 = tr(LocaleKeys.msg_term3);
    // final msgTerm4 = tr(LocaleKeys.msg_term4);
    // final registerTxt = tr(LocaleKeys.register);

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
          appBar: AppBar(title: const Text(registerTxt)),
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
