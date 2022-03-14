part of 'otp_confirm.dart';

class OtpConfirmForm extends StatelessWidget {
  const OtpConfirmForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AutovalidateMode validateMode;
    if (context.read<OtpConfirmCubit>().state.showErrorMessages) {
      validateMode = AutovalidateMode.always;
    } else {
      validateMode = AutovalidateMode.disabled;
    }

    return Form(
      autovalidateMode: validateMode,
      child: Column(
        children: [
          BlocBuilder<OtpRequestNewCubit, OtpRequestNewState>(
            buildWhen: (prev, cur) =>
                prev.isSubmitting != cur.isSubmitting ||
                prev.failureOrSuccessOption != cur.failureOrSuccessOption,
            builder: (context, state) {
              return Column(
                children: const [
                  Text('OTP has been sent to you'),
                  Text('Please check'),
                ],
              );
            },
          ),
          // const Text('OTP has been sent to you'),
          // const Text('Please check'),
          BlocBuilder<OtpConfirmCubit, OtpConfirmState>(
            buildWhen: (prev, cur) => prev.phone != cur.phone,
            builder: (context, state) => PhoneInput(
              value: state.phone,
              onChanged: context.read<OtpConfirmCubit>().phoneChanged,
            ),
          ),
          kVSpaceXXL,
          BlocBuilder<OtpRequestNewCubit, OtpRequestNewState>(
            buildWhen: (prev, cur) =>
                prev.isSubmitting != cur.isSubmitting ||
                prev.failureOrSuccessOption != cur.failureOrSuccessOption,
            builder: (context, state) {
              return Row(
                children: [
                  const Spacer(),
                  state.isSubmitting
                      ? const SizedBox.square(
                          dimension: 15, child: CircularProgressIndicator())
                      : Link(
                          text: 'Resend another code',
                          onTap: state.isSubmitting
                              ? null
                              : context.read<OtpRequestNewCubit>().submitted,
                        ),
                ],
              );
            },
          ),
          kVSpaceXXL,
          BlocBuilder<OtpConfirmCubit, OtpConfirmState>(
            buildWhen: (prev, cur) => prev.isSubmitting != cur.isSubmitting,
            builder: (context, state) => FormSubmitBtn(
              child: Text(tr(LocaleKeys.txt_ok)),
              isSubmitting: state.isSubmitting,
              onPressed: context.read<OtpConfirmCubit>().submitted,
            ),
          ),
        ],
      ),
    );
  }
}
