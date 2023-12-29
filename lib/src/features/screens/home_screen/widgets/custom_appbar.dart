import 'package:flutter/material.dart';
import 'package:music_test/src/common/styles/app_colors.dart';
import 'package:music_test/src/features/screens/home_screen/widgets/profile_picture.dart';

import '../../../../common/tools/fonts.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Good Morning",
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              color: AppColors.white,
              fontFamily: FontFamily.EBGaramond.fFamily,
              fontWeight: FontWeight.bold,
              letterSpacing: 3,
              overflow: TextOverflow.visible),
        ),
        GestureDetector(
          onTap: () {
            Scaffold.of(context).openEndDrawer();
          },
          child: ProfilePicture(),
        ),
      ],
    );
  }
}
