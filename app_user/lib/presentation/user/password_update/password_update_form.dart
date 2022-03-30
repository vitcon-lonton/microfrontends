part of 'password_update.dart';

class PasswordUpdateForm extends StatelessWidget {
  const PasswordUpdateForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final txtConfirm = tr(LocaleKeys.txt_confirm).toUpperCase();

    return Form(
      autovalidateMode: AutovalidateMode.always,
      child: Column(children: [
        BlocBuilder<PasswordUpdateCubit, PasswordUpdateState>(
          buildWhen: (prev, cur) {
            return prev.password != cur.password ||
                prev.displayPassword != cur.displayPassword;
          },
          builder: (context, state) => PasswordInput(
            password: state.password,
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
            password: state.newPassword,
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
            password: state.confirmPassword,
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
            child: Text(txtConfirm),
            isSubmitting: state.isSubmitting,
            onPressed: state.valid
                ? context.read<PasswordUpdateCubit>().submitted
                : null,
          );
        }),
      ]),
    );
  }
}
