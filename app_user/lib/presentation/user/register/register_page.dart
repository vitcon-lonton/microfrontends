// ignore_for_file: unused_local_variable
part of 'register.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegisterCubit>(
      create: (_) => getIt<RegisterCubit>(),
      child: BlocListener<RegisterCubit, RegisterState>(
        listenWhen: (prev, cur) =>
            prev.registerFailureOrSuccessOption !=
            cur.registerFailureOrSuccessOption,
        listener: (context, state) {
          state.registerFailureOrSuccessOption.fold(
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
        child: Scaffold(
          appBar: AppBar(title: Text(tr(LocaleKeys.txt_register))),
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: kSpaceM),
            child: Column(
              children: const [
                kVSpaceXL,
                kVSpaceXL,
                RegisterForm(),
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
