part of 'setting.dart';

class SettingTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback? onTap;

  const SettingTile({
    Key? key,
    this.onTap,
    required this.title,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(title),
      leading: Icon(icon),
      contentPadding: const EdgeInsets.symmetric(horizontal: kSpaceXXL),
    );
  }
}
