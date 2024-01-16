import 'package:flutter/material.dart';


import '../../../widgets/see_more_button.dart';
import 'recently_list.dart';

class RecentlyText extends StatelessWidget {
  const RecentlyText({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(top: 15, left: 10),
      sliver: SliverToBoxAdapter(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Recently played",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SeeMoreButton(
              function: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RecentlyList(),
                ),
              ),
              text: "Show all",
            ),
          ],
        ),
      ),
    );
  }
}
