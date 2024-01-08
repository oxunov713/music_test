import 'package:flutter/material.dart';

import '../../../../common/styles/app_colors.dart';
import '../../../../common/tools/fonts.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    required this.title,
    required this.icon,
    required this.function,
    Key? key,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final void Function() function;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: function,
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontFamily: FontFamily.Exo2.fFamily,
              color: Theme.of(context).cardColor,
            ),
      ),
      leading: CircleAvatar(
        child: Icon(icon),
      ),
      trailing: Icon(Icons.navigate_next_outlined),
    );
  }
}
