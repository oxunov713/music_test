import 'package:flutter/material.dart';

import '../../../../../../common/tools/fonts.dart';

class MixesText extends StatelessWidget {
  const MixesText({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(top: 15, left: 10),
      sliver: SliverToBoxAdapter(
        child: Text(
          "Made for you",
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontFamily: FontFamily.Montserrat.fFamily,
              ),
        ),
      ),
    );
  }
}
