part of 'otp_confirm.dart';

class OtpConfirmPage extends StatelessWidget {
  const OtpConfirmPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: getIt<OtpConfirmCubit>()),
        BlocProvider.value(value: getIt<OtpRequestNewCubit>()),
        BlocProvider.value(value: getIt<PasswordForgetCubit>()),
      ],
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
          appBar: AppBar(title: Text(tr(LocaleKeys.txt_activate_account))),
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: kSpaceM),
            child: Column(
              children: const [
                kVSpaceXL,
                kVSpaceXL,
                OtpConfirmForm(),
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
