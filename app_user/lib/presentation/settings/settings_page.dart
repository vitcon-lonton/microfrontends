import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme_manager/theme_manager.dart';

import 'package:auth/application/application.dart';

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
      child: WScaffold(
        body: Column(
          children: [
            const SizedBox.square(
              dimension: 150,
              child: CircleAvatar(
                // backgroundColor: Colors.transparent,
                child: Icon(Icons.person_outline_sharp, size: 120),
              ),
            ),
            kVSpaceM,
            BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                return InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: kSpaceS),
                    child: Row(
                      children: [
                        const Spacer(),
                        Text(
                          state.maybeMap(
                              orElse: () => 'Login',
                              authenticated: (_) => 'Name'),
                          // style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                );
              },
            ),
            Row(
              children: [
                const Spacer(),
                const Text('Update profile'),
                kHSpaceXXS,
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.edit),
                ),
                const Spacer(),
              ],
            ),
            kVSpaceM,
            Padding(
              padding: const EdgeInsets.symmetric(vertical: kSpaceL),
              child: Row(
                children: [
                  _button('Order history', Icons.history),
                  kHSpaceL,
                  _button('Notification', Icons.notification_add),
                ],
              ),
            ),
            ..._options.map((item) {
              final title = item['title'] as String;
              final icon = item['icon'] as IconData;

              return ListTile(
                title: Text(title),
                leading: Icon(icon),
                onTap: () {
                  if (title != 'Logout') {
                    return;
                  }

                  _confirmLogOut(context);
                },
              );
            }).toList(),
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

  Widget _button(String title, IconData iconData) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: kSpaceL),
        ),
        onPressed: () {},
        child: Column(
          children: [
            Icon(iconData),
            Text(title),
          ],
        ),
      ),
    );
  }
}
