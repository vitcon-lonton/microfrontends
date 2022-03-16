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
            prev.failureOrSuccessOption != cur.failureOrSuccessOption,
        listener: (context, state) {
          state.failureOrSuccessOption.fold(
            () {},
            (either) => either.fold(
              (failure) {
                final message = failure.maybeWhen(
                    orElse: () => 'Unable register',
                    unableRegister: (errors) => errors.join(', '));

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
