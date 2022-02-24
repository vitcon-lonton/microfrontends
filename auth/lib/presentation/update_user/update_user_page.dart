part of 'update_user.dart';

class UpdateUserPage extends StatelessWidget {
  const UpdateUserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const registerTxt = 'Update Profile';
    // final msgTerm1 = tr(LocaleKeys.msg_term1);
    // final msgTerm2 = tr(LocaleKeys.msg_term2);
    // final msgTerm3 = tr(LocaleKeys.msg_term3);
    // final msgTerm4 = tr(LocaleKeys.msg_term4);
    // final registerTxt = tr(LocaleKeys.register);

    return BlocProvider<UpdateUserCubit>(
      create: (_) => context.read<UpdateUserCubit>(),
      child: BlocListener<UpdateUserCubit, UpdateUserState>(
        listenWhen: (prev, cur) => prev.status != cur.status,
        listener: (context, state) {
          state.status.maybeMap(
            orElse: () => null,
            // complete: (_) => Navigator.of(context).pushNamed(Routes.home),
            failed: (_) {
              final snackBar = SnackBar(
                behavior: SnackBarBehavior.floating,
                action: SnackBarAction(label: 'Action', onPressed: () {}),
                content: const Text('Invalid email and password combination'),
              );

              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
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
                UpdateUserForm(),
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
