part of 'user_update.dart';

class UserUpdateForm extends StatefulWidget {
  const UserUpdateForm({Key? key}) : super(key: key);

  @override
  State<UserUpdateForm> createState() => _UserUpdateFormState();
}

class _UserUpdateFormState extends State<UserUpdateForm> {
  @override
  Widget build(BuildContext context) {
    final txtEmail = tr(LocaleKeys.txt_email);
    final txtUpdate = tr(LocaleKeys.txt_update);
    final txtFullName = tr(LocaleKeys.txt_full_name);
    final txtDateOfBirth = tr(LocaleKeys.txt_date_of_birth);
    final txtPhoneNumber = tr(LocaleKeys.txt_phone_number);

    return BlocBuilder<UserCubit, UserState>(builder: (context, state) {
      final user = state.whenOrNull(founded: (user) => user);
      final uName = user?.name.value.toOption().toNullable();
      final uPhone = user?.phone.value.toOption().toNullable();
      final uBirthDay = user?.birthDay.value.toOption().toNullable();
      final uEmailAddress = user?.emailAddress.value.toOption().toNullable();
      final nameKey = Key(uName ?? 'nameKey');
      final phoneKey = Key(uPhone ?? 'phoneKey');
      final birthDayKey = Key(uBirthDay?.toString() ?? 'birthDayKey');
      final emailAddressKey = Key(uEmailAddress ?? 'emailAddressKey');

      return Form(
        child: Column(children: [
          // AVATAR
          const UserImgSelector(),

          // NAME
          kVSpaceM,
          TextFormField(
            key: nameKey,
            initialValue: uName,
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
          ),

          // BIRTHDAY
          kVSpaceM,
          TextFormField(
            enabled: false,
            key: birthDayKey,
            initialValue: uBirthDay?.toString(),
            decoration: InputDecoration(
              labelText: txtDateOfBirth,
              suffixIcon: const Icon(Icons.calendar_today_outlined),
            ),
          ),

          // PHONE
          kVSpaceM,
          TextFormField(
            enabled: false,
            key: phoneKey,
            initialValue: uPhone,
            decoration: InputDecoration(labelText: txtPhoneNumber),
          ),

          // EMAIL ADDRESS
          kVSpaceM,
          TextFormField(
            initialValue: uEmailAddress,
            key: emailAddressKey,
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
          ),

          // SUBMIT BUTTON
          kVSpaceXXL,
          BlocBuilder<UserUpdateCubit, UserUpdateState>(buildWhen: (prev, cur) {
            return prev.isAvailable != cur.isAvailable;
          }, builder: (context, state) {
            if (!state.isAvailable) {
              return FormSubmitBtn(child: Text(txtUpdate));
            }

            return BlocBuilder<UserUpdateCubit, UserUpdateState>(
                builder: (context, state) {
              if (state.isSubmitting) {
                return FormSubmitBtn(
                    child: Text(txtUpdate), isSubmitting: true);
              }

              return FormSubmitBtn(
                  child: Text(txtUpdate),
                  onPressed: context.read<UserUpdateCubit>().updated);
            }, buildWhen: (prev, cur) {
              return prev.isSubmitting != cur.isSubmitting;
            });
          }),
        ]),
        autovalidateMode: AutovalidateMode.always,
      );
    });
  }
}

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