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
            buildWhen: (prev, cur) => prev.phone != cur.phone,
            builder: (context, state) => PhoneInput(
              value: state.phone,
              onChanged: context.read<ForgetPasswordCubit>().phoneChanged,
            ),
          ),
          kVSpaceXXL,
          BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
            buildWhen: (prev, cur) => prev.status != cur.status,
            builder: (context, state) => FormSubmitBtn(
              child: const Text('OK'),
              isSubmitting:
                  state.status.maybeMap(busy: (_) => true, orElse: () => false),
              onPressed: context.read<ForgetPasswordCubit>().submitted,
            ),
          ),
        ],
      ),
    );
  }
}
