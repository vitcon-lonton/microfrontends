part of 'setting.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final _options = [
    {'title': 'Favorites', 'icon': Icons.favorite},
    {'title': 'Address', 'icon': Icons.location_city},
    {'title': 'Policy', 'icon': Icons.policy},
    {'title': 'About', 'icon': Icons.info},
    {'title': 'Update password', 'icon': Icons.key},
    {'title': 'Logout', 'icon': Icons.exit_to_app},
  ];

  @override
  Widget build(BuildContext context) {
    final txtNotification = tr(LocaleKeys.txt_notification);
    final txtOrderHistory = tr(LocaleKeys.txt_order_history);

    return MultiBlocListener(
      listeners: [
        BlocListener<AuthBloc, AuthState>(listener: (context, state) {
          state.maybeWhen(
              orElse: () {},
              unauthenticated: () {
                context.read<UserCubit>().getUserRequested();
              });
        }),
        // BlocListener<UserCubit, UserState>(
        //   listener: (context, state) {
        //     state.maybeWhen(founded: (user) {}, orElse: () {});
        //   },
        // ),
      ],
      child: Scaffold(
        appBar: AppBar(),
        backgroundColor: Theme.of(context).primaryColor,
        body: SingleChildScrollView(
          child: Column(children: [
            DefaultTextStyle(
              style: const TextStyle(color: Colors.white),
              child: Column(children: [
                BlocBuilder<UserCubit, UserState>(builder: (context, state) {
                  return state.maybeWhen(founded: (user) {
                    if (user.image == null) {
                      return SizedBox.square(
                        dimension: 80,
                        child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(Icons.person_rounded,
                                size: 60, color: Colors.grey.shade500)),
                      );
                    }

                    return SizedBox.square(
                      dimension: 80,
                      child: ClipRRect(
                          child: DMQImage.network(user.image!),
                          borderRadius: BorderRadius.circular(100)),
                    );
                  }, orElse: () {
                    return SizedBox.square(
                      dimension: 80,
                      child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(Icons.person_rounded,
                              size: 60, color: Colors.grey.shade500)),
                    );
                  });
                }),

                BlocBuilder<UserCubit, UserState>(builder: (context, state) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: kSpaceS),
                    child: Row(children: [
                      const Spacer(),
                      Text(state.maybeWhen(orElse: () {
                        return 'Login';
                      }, founded: (user) {
                        return user.name.getOrCrash();
                      })),
                      const Spacer()
                    ]),
                  );
                }),

                //
                BlocBuilder<UserCubit, UserState>(builder: (context, state) {
                  return state.maybeWhen(founded: (user) {
                    return Row(children: [
                      const Spacer(),
                      IconButton(
                        iconSize: 14,
                        color: Colors.white,
                        icon: const Icon(Icons.edit),
                        onPressed: () {
                          context.router.push(const UserUpdatePageRoute());
                        },
                      ),
                      Text(tr(LocaleKeys.txt_edit)),
                      const Spacer(),
                    ]);
                  }, orElse: () {
                    return Row(children: [
                      const Spacer(),
                      Theme(
                          data: Theme.of(context).copyWith(
                              primaryColor:
                                  Theme.of(context).colorScheme.onPrimary),
                          child: Link(
                              text: 'Login now',
                              onTap: () => context.router
                                  .push(const SignInPageRoute()))),
                      const Spacer()
                    ]);
                  });
                }),
              ]),
            ),
            kVSpaceXXS,
            // kVSpaceXS,
            BlocBuilder<UserCubit, UserState>(builder: (context, state) {
              return Stack(children: [
                Column(children: [
                  Container(
                    margin: const EdgeInsets.only(top: 36),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(16.0)),
                    ),
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemCount: _options.length,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.only(top: kSpaceXL * 2),
                      separatorBuilder: (context, i) => const Padding(
                        child: Divider(height: 0),
                        padding: EdgeInsets.symmetric(horizontal: kSpaceXXL),
                      ),
                      itemBuilder: (context, i) {
                        String title = 'Logout';
                        VoidCallback? onTap;

                        final item = _options[i];
                        final key = item['title'] as String;
                        final icon = item['icon'] as IconData;

                        if (key == 'Logout') {
                          return const LogoutTile();
                        } else if (key == 'Favorites') {
                          title = tr(LocaleKeys.txt_favorite_service);
                          onTap = () {
                            context.router.push(const FavoritesPageRoute());
                          };
                        } else if (key == 'Address') {
                          title = tr(LocaleKeys.txt_delivery_address);
                          onTap = () {};
                        } else if (key == 'Policy') {
                          title = tr(LocaleKeys.txt_policy);
                          onTap = () {};
                        } else if (key == 'About') {
                          title = tr(LocaleKeys.txt_about_us);
                          onTap = () {};
                        } else if (key == 'Update password') {
                          title = tr(LocaleKeys.txt_change_password);
                          onTap = () {
                            context.router
                                .push(const PasswordUpdatePageRoute());
                          };
                        }

                        return SettingTile(
                            icon: icon, title: title, onTap: onTap);
                      },
                    ),
                  ),
                  // Expanded(child: Container(color: Colors.white)),
                ]),
                Container(
                  height: 100,
                  margin: const EdgeInsets.symmetric(horizontal: kSpaceXXL),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                          blurRadius: 15,
                          offset: Offset(0, 4), // changes position of shadow
                          color: Colors.black12)
                    ],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Row(children: [
                      _button(txtOrderHistory, Icons.access_time_filled,
                          onPressed: () {
                        context.router.push(const BookingHistoriesPageRoute());
                      }),
                      _button(txtNotification, Icons.notifications,
                          onPressed: () {
                        context.router.push(const NotificationsPageRoute());
                      }),
                    ]),
                  ),
                ),
              ]);
            }),
          ]),
        ),
      ),
    );
  }

  Widget _button(String title, IconData iconData, {VoidCallback? onPressed}) {
    return Expanded(
      child: SizedBox(
        height: 100,
        child: TextButton(
            onPressed: onPressed,
            child: Column(children: [Icon(iconData), kVSpaceXXS, Text(title)]),
            style: TextButton.styleFrom(
                shape: const BeveledRectangleBorder(),
                padding: const EdgeInsets.symmetric(vertical: kSpaceL))),
      ),
    );
  }
}
