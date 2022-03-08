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
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        // state.map(
        //   initial: (_) {},
        //   authenticated: (_) =>
        //       AutoRouter.of(context).replace(const NotesOverviewPageRoute()),
        //   unauthenticated: (_) =>
        //       AutoRouter.of(context).replace(const SignInPageRoute()),
        // );
      },
      child: Scaffold(
        appBar: AppBar(),
        backgroundColor: Colors.red,
        body: Column(
          children: [
            DefaultTextStyle(
              style: const TextStyle(color: Colors.white),
              child: Column(children: [
                kVSpaceM,
                SizedBox.square(
                  dimension: 80,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person_rounded,
                      size: 60,
                      color: Colors.grey.shade500,
                    ),
                  ),
                ),
                kVSpaceM,
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: kSpaceS),
                      child: Row(
                        children: [
                          const Spacer(),
                          Text(state.maybeMap(
                              orElse: () => 'Login',
                              authenticated: (_) => 'Name')),
                          const Spacer(),
                        ],
                      ),
                    );
                  },
                ),
                Row(children: [
                  const Spacer(),
                  IconButton(
                    iconSize: 14,
                    color: Colors.white,
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      context.router.push(const UserUpdatePageRoute());
                    },
                  ),
                  const Text('Update profile'),
                  const Spacer(),
                ]),
              ]),
            ),
            kVSpaceXXS,
            // kVSpaceXS,
            Expanded(
              child: Stack(
                children: [
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
                        padding:
                            const EdgeInsets.only(top: kSpaceXXL + kSpaceL),
                        physics: const NeverScrollableScrollPhysics(),
                        separatorBuilder: (context, i) => const Padding(
                          child: Divider(height: 0),
                          padding: EdgeInsets.symmetric(horizontal: kSpaceXXL),
                        ),
                        itemBuilder: (context, i) {
                          final item = _options[i];
                          final title = item['title'] as String;

                          return SettingTile(
                            item: item,
                            onTap: () {
                              if (title == 'Logout') {
                                _confirmLogOut(context);
                              } else if (title == 'Favorites') {
                                context.router.push(const FavoritesPageRoute());
                                return;
                              } else if (title == 'Address') {
                                return;
                              } else if (title == 'Policy') {
                                return;
                              } else if (title == 'About') {
                                return;
                              } else if (title == 'Update password') {
                                context.router
                                    .push(const PasswordUpdatePageRoute());
                                return;
                              }
                            },
                          );
                        },
                      ),
                    ),
                    Expanded(child: Container(color: Colors.white)),
                  ]),
                  Container(
                    height: 80,
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
                        _button('Order history', Icons.access_time_filled,
                            onPressed: () {
                          context.router.push(const OrderHistoriesPageRoute());
                        }),
                        _button('Notification', Icons.notifications,
                            onPressed: () {
                          context.router.push(const NotificationsPageRoute());
                        }),
                      ]),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _confirmLogOut(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => Material(
        color: Colors.transparent,
        // width: Theme.of(context).backgroundColor,
        child: Column(
          children: [
            const Spacer(),
            Container(
              color: Colors.white,
              margin: const EdgeInsets.symmetric(horizontal: kSpaceXXL),
              padding: const EdgeInsets.symmetric(
                  vertical: kSpaceXL, horizontal: kSpaceXXL),
              child: Column(
                children: [
                  kVSpaceL,
                  const Text('Are you want log out ?'),
                  kVSpaceXL,
                  kVSpaceXL,
                  Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          child: const Text('Cancel'),
                          onPressed: Navigator.of(context).pop,
                        ),
                      ),
                      kHSpaceL,
                      Expanded(
                        child: ElevatedButton(
                          child: const Text('Log out'),
                          style: ElevatedButton.styleFrom(
                              elevation: 0, shadowColor: Colors.transparent),
                          onPressed: () {
                            context
                                .read<AuthBloc>()
                                .add(const AuthEvent.signedOut());

                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                    ],
                  ),
                  kVSpaceL,
                ],
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  Widget _button(String title, IconData iconData, {VoidCallback? onPressed}) {
    return Expanded(
      child: SizedBox(
        height: 80,
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
