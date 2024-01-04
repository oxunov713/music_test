import 'package:flutter/material.dart';

import '../../../../../../common/tools/fonts.dart';

class YourFavouriteAlbumText extends StatelessWidget {
  const YourFavouriteAlbumText({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(top: 20, left: 10, bottom: 15),
      sliver: SliverToBoxAdapter(
        child: Text(
          "Your Favorite Playlists",
          style: Theme.of(context)
              .textTheme
              .headlineMedium
              ?.copyWith(fontFamily: FontFamily.JosefinSans.fFamily),
        ),
      ),
    );
  }
}
