part of 'forget_password.dart';

class ForgetPasswordForm extends StatelessWidget {
  const ForgetPasswordForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode:
          context.read<ForgetPasswordCubit>().state.showErrorMessages
              ? AutovalidateMode.always
              : AutovalidateMode.disabled,
      child: Column(
        children: [
          BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
            buildWhen: (prev, cur) => prev.emailAddress != cur.emailAddress,
            builder: (context, state) {
              return WTextInput(
                hintText: 'Email',
                errorText: context
                    .read<ForgetPasswordCubit>()
                    .state
                    .emailAddress
                    .value
                    .fold((failure) {
                  return failure.maybeMap(
                      orElse: () => null, invalidEmail: (_) => 'Invalid Email');
                }, (_) => null),
                onChanged:
                    context.read<ForgetPasswordCubit>().emailAddressChanged,
              );
            },
          ),
          kVSpaceM,
          BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
            buildWhen: (prev, cur) => prev.status != cur.status,
            builder: (context, state) => WSubmitBtn(
              child: state.status.maybeMap(
                busy: (_) => const Text('....'),
                orElse: () => const Text('SUBMIT'),
              ),
              onPressed: state.status.maybeMap(
                busy: (_) => null,
                orElse: () => context.read<ForgetPasswordCubit>().submitted,
              ),
              // onPressed: context.read<ForgetPasswordCubit>().emailSubmitted,
            ),
          ),
        ],
      ),
    );
  }
}
