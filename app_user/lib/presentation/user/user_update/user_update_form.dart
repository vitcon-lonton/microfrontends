part of 'user_update.dart';

class UserUpdateForm extends StatefulWidget {
  const UserUpdateForm({Key? key}) : super(key: key);

  @override
  State<UserUpdateForm> createState() => _UserUpdateFormState();
}

class _UserUpdateFormState extends State<UserUpdateForm> {
  @override
  Widget build(BuildContext context) {
    final user = context.read<UserCubit>().state.whenOrNull(founded: (user) {
      return user;
    });
    final txtEmail = tr(LocaleKeys.txt_email);
    final txtUpdate = tr(LocaleKeys.txt_update);
    final txtFullName = tr(LocaleKeys.txt_full_name);
    final txtDateOfBirth = tr(LocaleKeys.txt_date_of_birth);
    final txtPhoneNumber = tr(LocaleKeys.txt_phone_number);

    final userName = user?.name.value.toOption().toNullable();
    final userPhone = user?.phone.value.toOption().toNullable();
    final userEmailAddress = user?.emailAddress.value.toOption().toNullable();
    final userBirthDay =
        user?.birthDay.value.toOption().toNullable().toString();

    final AutovalidateMode autovalidateMode;
    if (context.read<UserUpdateCubit>().state.showErrorMessages) {
      autovalidateMode = AutovalidateMode.always;
    } else {
      autovalidateMode = AutovalidateMode.disabled;
    }

    return Form(
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          // Container(
          //   width: 170,
          //   height: 170,
          //   decoration: BoxDecoration(
          //       border: Border.all(), borderRadius: BorderRadius.circular(150)),
          //   child: IconButton(
          //     iconSize: 105,
          //     onPressed: () {},
          //     icon: const Icon(Icons.camera_alt_sharp),
          //   ),
          // ),
          const UserImgSelector(),

          kVSpaceM,
          BlocBuilder<UserUpdateCubit, UserUpdateState>(
            buildWhen: (prev, cur) => prev.name != cur.name,
            builder: (context, state) {
              return TextFormField(
                initialValue: userName,
                decoration: InputDecoration(labelText: txtFullName),
                onChanged: context.read<UserUpdateCubit>().nameChanged,
                validator: (_) {
                  return context
                      .read<UserUpdateCubit>()
                      .state
                      .name
                      ?.value
                      .fold((failure) => '$txtFullName Invalid', (_) => null);
                },
              );
            },
          ),

          kVSpaceM,
          BlocBuilder<UserUpdateCubit, UserUpdateState>(
            buildWhen: (prev, cur) => prev.birthDay != cur.birthDay,
            builder: (context, state) {
              return TextFormField(
                enabled: false,
                initialValue: userBirthDay,
                decoration: InputDecoration(
                  labelText: txtDateOfBirth,
                  suffixIcon: const Icon(Icons.calendar_today_outlined),
                ),
              );
            },
          ),

          kVSpaceM,
          BlocBuilder<UserUpdateCubit, UserUpdateState>(
            buildWhen: (prev, cur) => prev.phone != cur.phone,
            builder: (context, state) {
              return TextFormField(
                  enabled: false,
                  initialValue: userPhone,
                  decoration: InputDecoration(labelText: txtPhoneNumber));
            },
          ),

          kVSpaceM,
          BlocBuilder<UserUpdateCubit, UserUpdateState>(
            buildWhen: (prev, cur) => prev.emailAddress != cur.emailAddress,
            builder: (context, state) {
              return TextFormField(
                initialValue: userEmailAddress,
                decoration: InputDecoration(labelText: txtEmail),
                onChanged: context.read<UserUpdateCubit>().emailAddressChanged,
                validator: (_) {
                  return context
                      .read<UserUpdateCubit>()
                      .state
                      .emailAddress
                      ?.value
                      .fold((failure) => '$txtEmail Invalid', (_) => null);
                },
              );
            },
          ),

          kVSpaceXXL,
          BlocBuilder<UserUpdateCubit, UserUpdateState>(
              buildWhen: (prev, cur) =>
                  prev.isAvailable != cur.isAvailable ||
                  prev.isSubmitting != cur.isSubmitting,
              builder: (context, state) => FormSubmitBtn(
                  child: Text(txtUpdate),
                  isSubmitting: state.isSubmitting,
                  onPressed: !state.isAvailable
                      ? null
                      : context.read<UserUpdateCubit>().updated)),
        ],
      ),
    );
  }
}
