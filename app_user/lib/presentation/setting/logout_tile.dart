part of 'setting.dart';

class LogoutTile extends StatelessWidget {
  const LogoutTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final txtLogout = tr(LocaleKeys.txt_logout);

    return BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          if (state.user != null) {
            return ListTile(
                title: Text(txtLogout),
                onTap: () => _confirmLogOut(context),
                leading: const Icon(Icons.exit_to_app),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: kSpaceXXL));
          }

          return kSpaceZero;
        },
        buildWhen: (prev, cur) => prev.user != cur.user);
  }

  void _confirmLogOut(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => Material(
        color: Colors.transparent,
        // width: Theme.of(context).backgroundColor,
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
                  Text(tr(LocaleKeys.msg_12)),
                  kVSpaceXL,
                  kVSpaceXL,
                  Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          child: Text(tr(LocaleKeys.txt_cancel)),
                          onPressed: Navigator.of(context).pop,
                        ),
                      ),
                      kHSpaceL,
                      Expanded(
                        child: ElevatedButton(
                          child: Text(tr(LocaleKeys.txt_logout)),
                          style: ElevatedButton.styleFrom(
                              elevation: 0, shadowColor: Colors.transparent),
                          onPressed: () {
                            context
                                .read<AuthBloc>()
                                .add(const AuthEvent.signedOut());

                            Navigator.of(context).pop();
                          },
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
