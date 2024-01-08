import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_test/src/data/providers/theme/theme_provider.dart';
import 'package:provider/provider.dart';

import '../../../../../common/styles/app_colors.dart';
import '../../../../../common/tools/fonts.dart';
import '../../widgets/custom_list_tile.dart';
import '../../widgets/profile_picture.dart';

class CustomDrawerProfile extends StatefulWidget {
  CustomDrawerProfile({super.key});

  @override
  State<CustomDrawerProfile> createState() => _CustomDrawerProfileState();
}

class _CustomDrawerProfileState extends State<CustomDrawerProfile> {
  late ThemeProvider viewModelRead;
  late ThemeProvider viewModelWatch;

  @override
  void didChangeDependencies() {
    viewModelRead = context.read<ThemeProvider>();
    viewModelWatch = context.watch<ThemeProvider>();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/background_profile.png"),
              ),
            ),
            accountName: Text(
              "Jony English",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: AppColors.white),
            ),
            accountEmail: Text(
              "jonyenglish@example.com",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: AppColors.white80),
            ),
            currentAccountPicture: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: ProfilePicture(),
            ),
          ),
          //List tile lar
          CustomListTile(
            title: "Account",
            icon: Icons.person_outline,
            function: () {},
          ),
          ListTile(
            leading: CircleAvatar(
              child: Icon(
                viewModelWatch.darkMode ? Icons.nights_stay : Icons.sunny,
              ),
            ),
            title: Text(
              "Theme",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontFamily: FontFamily.Exo2.fFamily,
                    color: Theme.of(context).cardColor,
                  ),
            ),
            trailing: Switch(
              value: viewModelWatch.darkMode,
              onChanged: (value) {
                viewModelRead.changeTheme();
              },
            ),
          ),

          CustomListTile(
            title: "Language",
            icon: Icons.language,
            function: () {},
          ),
          CustomListTile(
            title: "Settings",
            icon: Icons.settings,
            function: () {},
          ),
          CustomListTile(
            title: "F.A.Q",
            icon: Icons.info_outline,
            function: () {},
          ),
          CustomListTile(
            title: "Log out",
            icon: Icons.logout,
            function: () => Navigator.popAndPushNamed(context, '/login'),
          ),
        ],
      ),
    );
  }
}
