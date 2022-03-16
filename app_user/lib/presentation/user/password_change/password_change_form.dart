part of 'password_change.dart';

class PasswordChangeForm extends StatelessWidget {
  const PasswordChangeForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode:
          context.read<PasswordChangeCubit>().state.showErrorMessages
              ? AutovalidateMode.always
              : AutovalidateMode.disabled,
      child: Column(
        children: [
          kVSpaceM,
          BlocBuilder<PasswordChangeCubit, PasswordChangeState>(
            buildWhen: (prev, cur) =>
                prev.password != cur.password ||
                prev.displayPassword != cur.displayPassword,
            builder: (context, state) => PasswordInput(
              password: state.password,
              showPassword: state.displayPassword,
              onPressShowPassword: () => context
                  .read<PasswordChangeCubit>()
                  .displayPasswordChanged(!state.displayPassword),
              onChanged: context.read<PasswordChangeCubit>().passwordChanged,
            ),
          ),
          kVSpaceM,
          BlocBuilder<PasswordChangeCubit, PasswordChangeState>(
            buildWhen: (prev, cur) =>
                prev.confirmPassword != cur.confirmPassword ||
                prev.displayConfirmPassword != cur.displayConfirmPassword,
            builder: (context, state) => PasswordInput(
              password: state.confirmPassword,
              showPassword: state.displayConfirmPassword,
              onPressShowPassword: () => context
                  .read<PasswordChangeCubit>()
                  .displayConfirmPasswordChanged(!state.displayConfirmPassword),
              onChanged: context.read<PasswordChangeCubit>().passwordChanged,
            ),
          ),
          kVSpaceM,
          BlocBuilder<PasswordChangeCubit, PasswordChangeState>(
            buildWhen: (prev, cur) => prev.isSubmitting != cur.isSubmitting,
            builder: (context, state) => FormSubmitBtn(
              child: const Text('CONFIRM'),
              isSubmitting: state.isSubmitting,
              onPressed: context.read<PasswordChangeCubit>().submitted,
            ),
          ),
        ],
      ),
    );
  }
}
