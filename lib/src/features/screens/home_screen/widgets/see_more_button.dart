import 'package:flutter/material.dart';

import '../../../../common/styles/app_colors.dart';
import '../../../../common/tools/fonts.dart';

class SeeMoreButton extends StatelessWidget {
  const SeeMoreButton({super.key, required this.function, required this.text});

  final Function() function;
  final String text;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: function,
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontFamily: FontFamily.SpaceGrotesk.fFamily,
              color: AppColors.green,
              letterSpacing: 1,
            ),
      ),
    );
  }
}
