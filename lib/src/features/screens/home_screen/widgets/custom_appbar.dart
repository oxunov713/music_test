import 'package:flutter/material.dart';
import 'package:music_test/src/common/styles/app_colors.dart';

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
        const CircleAvatar(
          backgroundImage: NetworkImage(
              "https://i.scdn.co/image/ab67706c0000da845d58739ab68aae003ab5ec87"),
          radius: 25,
        ),
      ],
    );
  }
}
