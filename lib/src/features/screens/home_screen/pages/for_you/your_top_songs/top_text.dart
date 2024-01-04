import 'package:flutter/material.dart';

import '../../../widgets/see_more_button.dart';

class YourTopSongsText extends StatelessWidget {
  const YourTopSongsText({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(top: 20, left: 10, bottom: 15),
      sliver: SliverToBoxAdapter(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Your top songs",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SeeMoreButton(
              function: () {},
              text: "Show all",
            ),
          ],
        ),
      ),
    );
  }
}
