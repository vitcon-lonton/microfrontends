part of 'setting.dart';

class SettingTile extends StatelessWidget {
  final dynamic item;
  final VoidCallback? onTap;

  const SettingTile({Key? key, required this.item, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final item = _options[i];
    final title = item['title'] as String;
    final icon = item['icon'] as IconData;

    return ListTile(
      onTap: onTap,
      title: Text(title),
      leading: Icon(icon),
      contentPadding: const EdgeInsets.symmetric(horizontal: kSpaceXXL),
    );
  }
}
