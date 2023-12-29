import 'package:flutter/material.dart';

import '../../../../common/styles/app_colors.dart';
import '../../../../common/tools/fonts.dart';

class LibraryAlbums extends StatelessWidget {
  const LibraryAlbums({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dark,
      body: ListView.builder(
        itemBuilder: (context, index) => ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          leading: SizedBox.square(
            dimension: 60,
            child: Image(
              image: NetworkImage(
                  "https://upload.wikimedia.org/wikipedia/ru/2/2f/Billie_Eilish_-_Don%27t_Smile_at_Me.png"),
            ),
          ),
          title: Text(
            "Rainy musics ",
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontFamily: FontFamily.JosefinSans.fFamily,
                  color: AppColors.white,
                  overflow: TextOverflow.ellipsis,
                ),
          ),
          subtitle: Text(
            "Albums ",
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontFamily: FontFamily.JosefinSans.fFamily,
                  color: AppColors.blueTextStory,
                  overflow: TextOverflow.ellipsis,
                ),
          ),
          trailing: PopupMenuButton(
            itemBuilder: (context) => [],
          ),
        ),
        itemCount: 20,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.blue80,
        child: Icon(
          Icons.add,
          color: AppColors.white,
        ),
      ),
    );
  }
}
