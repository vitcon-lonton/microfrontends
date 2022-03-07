part of 'password_update.dart';

class PasswordUpdateForm extends StatelessWidget {
  const PasswordUpdateForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mode = context.read<PasswordUpdateCubit>().state.showErrorMessages
        ? AutovalidateMode.always
        : AutovalidateMode.disabled;

    return Form(
      autovalidateMode: mode,
      child: Column(
        children: [
          kVSpaceM,
          BlocBuilder<PasswordUpdateCubit, PasswordUpdateState>(
            buildWhen: (prev, cur) =>
                prev.password != cur.password ||
                prev.displayPassword != cur.displayPassword,
            builder: (context, state) => PasswordInput(
              value: state.password,
              showPassword: state.displayPassword,
              onPressShowPassword: () => context
                  .read<PasswordUpdateCubit>()
                  .displayPasswordChanged(!state.displayPassword),
              onChanged: context.read<PasswordUpdateCubit>().passwordChanged,
            ),
          ),
          kVSpaceM,
          BlocBuilder<PasswordUpdateCubit, PasswordUpdateState>(
            buildWhen: (prev, cur) {
              return prev.newPassword != cur.newPassword ||
                  prev.displayNewPassword != cur.displayNewPassword;
            },
            builder: (context, state) => PasswordInput(
              value: state.newPassword,
              showPassword: state.displayNewPassword,
              onPressShowPassword: () => context
                  .read<PasswordUpdateCubit>()
                  .displayNewPasswordChanged(!state.displayNewPassword),
              onChanged: context.read<PasswordUpdateCubit>().newPasswordChanged,
            ),
          ),
          kVSpaceM,
          BlocBuilder<PasswordUpdateCubit, PasswordUpdateState>(
            buildWhen: (prev, cur) =>
                prev.confirmPassword != cur.confirmPassword ||
                prev.displayConfirmPassword != cur.displayConfirmPassword,
            builder: (context, state) => PasswordInput(
              value: state.confirmPassword,
              showPassword: state.displayConfirmPassword,
              onPressShowPassword: () => context
                  .read<PasswordUpdateCubit>()
                  .displayConfirmPasswordChanged(!state.displayConfirmPassword),
              onChanged:
                  context.read<PasswordUpdateCubit>().confirmPasswordChanged,
            ),
          ),
          kVSpaceM,
          BlocBuilder<PasswordUpdateCubit, PasswordUpdateState>(
              buildWhen: (prev, cur) {
            return prev.valid != cur.valid ||
                prev.isSubmitting != cur.isSubmitting;
          }, builder: (context, state) {
            return FormSubmitBtn(
              child: const Text('CONFIRM'),
              isSubmitting: state.isSubmitting,
              onPressed: state.valid
                  ? context.read<PasswordUpdateCubit>().submitted
                  : null,
            );
          }),
        ],
      ),
    );
  }
}
