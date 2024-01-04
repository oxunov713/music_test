import 'package:flutter/material.dart';

import '../../../../../../common/tools/fonts.dart';
import '../../../widgets/see_more_button.dart';

class YourRadiosText extends StatelessWidget {
  const YourRadiosText({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(top: 20, left: 10, bottom: 15),
      sliver: SliverToBoxAdapter(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Your Radios",
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium
                  ?.copyWith(fontFamily: FontFamily.JosefinSans.fFamily),
            ),
            SeeMoreButton(function: () {}, text: "Show all")
          ],
        ),
      ),
    );
  }
}
