part of 'user_update.dart';

class UserUpdateForm extends StatefulWidget {
  const UserUpdateForm({Key? key}) : super(key: key);

  @override
  State<UserUpdateForm> createState() => _UserUpdateFormState();
}

class _UserUpdateFormState extends State<UserUpdateForm> {
  late final TextEditingController _emailController;
  late final TextEditingController _phoneController;
  late final TextEditingController _fullNameController;
  late final TextEditingController _birthdayController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _phoneController = TextEditingController();
    _fullNameController = TextEditingController();
    _birthdayController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _fullNameController.dispose();
    _birthdayController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<UserUpdateCubit, UserUpdateState>(
          listenWhen: (prev, cur) => prev.name != cur.name,
          listener: (context, state) {
            final nameStr = state.name.value.foldRight('', (value, previous) {
              return value;
            });

            if (_fullNameController.text != nameStr) {
              _fullNameController.text = nameStr;
            }
          },
        ),
        BlocListener<UserUpdateCubit, UserUpdateState>(
          listenWhen: (prev, cur) => prev.phone != cur.phone,
          listener: (context, state) {
            final phoneStr = state.phone.value.foldRight('', (value, previous) {
              return value;
            });

            if (_phoneController.text != phoneStr) {
              _phoneController.text = phoneStr;
            }
          },
        ),
        BlocListener<UserUpdateCubit, UserUpdateState>(
          listenWhen: (prev, cur) => prev.birthDay != cur.birthDay,
          listener: (context, state) {
            final birthDayStr = state.birthDay.value
                .foldRight('', (value, previous) => value.toIso8601String());

            if (_birthdayController.text != birthDayStr) {
              _birthdayController.text = birthDayStr;
            }
          },
        ),
        BlocListener<UserUpdateCubit, UserUpdateState>(
          listenWhen: (prev, cur) => prev.emailAddress != cur.emailAddress,
          listener: (context, state) {
            final emailStr = state.emailAddress.value
                .foldRight('', (value, previous) => value);

            if (_emailController.text != emailStr) {
              _emailController.text = emailStr;
            }
          },
        ),
      ],
      child: Form(
        autovalidateMode:
            context.read<UserUpdateCubit>().state.showErrorMessages
                ? AutovalidateMode.always
                : AutovalidateMode.disabled,
        child: Column(
          children: [
            Container(
              width: 170,
              height: 170,
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(150)),
              child: IconButton(
                iconSize: 105,
                onPressed: () {},
                icon: const Icon(Icons.camera_alt_sharp),
              ),
            ),
            kVSpaceM,
            BlocBuilder<UserUpdateCubit, UserUpdateState>(
              buildWhen: (prev, cur) => prev.name != cur.name,
              builder: (context, state) => WTextInput(
                label: 'Full Name',
                hintText: 'Full Name',
                controller: _fullNameController,
                errorText: state.name.value
                    .fold((failure) => 'Invalid Name', (_) => null),
                onChanged: context.read<UserUpdateCubit>().nameChanged,
              ),
            ),
            kVSpaceM,
            BlocBuilder<UserUpdateCubit, UserUpdateState>(
              buildWhen: (prev, cur) => prev.birthDay != cur.birthDay,
              builder: (context, state) => WTextInput(
                enabled: false,
                label: 'Birthday',
                hintText: 'Birthday',
                controller: _birthdayController,
                suffixIcon: const Icon(Icons.calendar_today_outlined),
              ),
            ),
            kVSpaceM,
            BlocBuilder<UserUpdateCubit, UserUpdateState>(
              buildWhen: (prev, cur) => prev.phone != cur.phone,
              builder: (context, state) => WTextInput(
                enabled: false,
                label: 'Phone',
                hintText: 'Phone',
                controller: _phoneController,
              ),
            ),
            kVSpaceM,
            BlocBuilder<UserUpdateCubit, UserUpdateState>(
              buildWhen: (prev, cur) => prev.emailAddress != cur.emailAddress,
              builder: (context, state) => WTextInput(
                label: 'Email',
                hintText: 'Email',
                controller: _emailController,
                errorText: state.emailAddress.value
                    .fold((failure) => 'Invalid Email', (_) => null),
                onChanged: context.read<UserUpdateCubit>().emailAddressChanged,
              ),
            ),
            kVSpaceXXL,
            BlocBuilder<UserUpdateCubit, UserUpdateState>(
              buildWhen: (prev, cur) => prev.isSubmitting != cur.isSubmitting,
              builder: (context, state) => FormSubmitBtn(
                child: const Text('UPDATE'),
                isSubmitting: state.isSubmitting,
                onPressed: context.read<RegisterCubit>().submitted,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
