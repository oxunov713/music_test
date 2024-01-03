import 'package:flutter/material.dart';
import 'package:music_test/src/common/styles/app_colors.dart';
import 'package:music_test/src/data/providers/greating_provider.dart';
import 'package:music_test/src/features/screens/home_screen/widgets/profile_picture.dart';
import 'package:provider/provider.dart';

import '../../../../common/tools/fonts.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  late GreatingViewModel viewRead;
  late GreatingViewModel viewWatch;

  @override
  void didChangeDependencies() {
    viewRead = context.read<GreatingViewModel>();
    viewWatch = context.watch<GreatingViewModel>();
    viewRead.changeGreating();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          viewWatch.greating,
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
