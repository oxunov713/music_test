import 'package:flutter/material.dart';

import '../../../widgets/see_more_button.dart';
import 'top_songs_list.dart';

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
              function: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => YourTopSongsList(),
                    ));
              },
              text: "Show all",
            ),
          ],
        ),
      ),
    );
  }
}
