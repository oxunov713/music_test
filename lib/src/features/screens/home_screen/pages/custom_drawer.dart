import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../common/styles/app_colors.dart';
import '../../../../common/tools/fonts.dart';
import '../widgets/custom_listtile.dart';
import '../widgets/profile_picture.dart';

class CustomDrawerProfile extends StatefulWidget {
  CustomDrawerProfile({super.key});

  @override
  State<CustomDrawerProfile> createState() => _CustomDrawerProfileState();
}

class _CustomDrawerProfileState extends State<CustomDrawerProfile> {
  bool themeBool = true;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.dark,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          //Avatar
          const UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/background_profile.png"),
              ),
            ),
            accountName: Text("Jony English"),
            accountEmail: Text("jonyenglish@example.com"),
            currentAccountPicture: ProfilePicture(),
          ),
          //List tile lar
          CustomListTile(
            title: "Account",
            icon: Icons.person_outline,
            function: () {},
          ),
          SwitchListTile(
            value: themeBool,
            title: Text(
              "Theme",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontFamily: FontFamily.Exo2.fFamily,
                    color: AppColors.white,
                  ),
            ),
            secondary: CircleAvatar(
              backgroundColor: AppColors.blue80,
              child: Icon(
                Icons.sunny,
                color: AppColors.blue,
              ),
            ),
            activeTrackColor: AppColors.blue80,
            onChanged: (value) {
              themeBool = !themeBool;
              setState(() {});
            },
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
