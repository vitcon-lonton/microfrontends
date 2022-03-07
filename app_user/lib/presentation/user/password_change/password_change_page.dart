// ignore_for_file: unused_local_variable
part of 'password_change.dart';

class PasswordChangePage extends StatelessWidget {
  const PasswordChangePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const registerTxt = 'Enter password';
    const msgTerm1 = 'tr(LocaleKeys.msg_term1)';
    const msgTerm2 = 'tr(LocaleKeys.msg_term2)';
    const msgTerm3 = 'tr(LocaleKeys.msg_term3)';
    const msgTerm4 = 'tr(LocaleKeys.msg_term4)';
    // final msgTerm1 = tr(LocaleKeys.msg_term1);
    // final msgTerm2 = tr(LocaleKeys.msg_term2);
    // final msgTerm3 = tr(LocaleKeys.msg_term3);
    // final msgTerm4 = tr(LocaleKeys.msg_term4);
    // final registerTxt = tr(LocaleKeys.register);

    return BlocProvider<PasswordChangeCubit>(
      create: (_) => context.read<PasswordChangeCubit>(),
      child: BlocListener<PasswordChangeCubit, PasswordChangeState>(
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
        child: WScaffold(
          appBar: const WAppBar(title: Text(registerTxt)),
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: kSpaceM),
            child: Column(
              children: const [
                kVSpaceXL,
                kVSpaceXL,
                PasswordChangeForm(),
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
