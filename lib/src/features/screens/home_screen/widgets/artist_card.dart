import 'package:flutter/material.dart';
import 'package:music_test/src/data/models/fake_data.dart';
import 'package:music_test/src/data/providers/home_screen_provider.dart';

import '../../../../common/styles/app_colors.dart';
import '../../../../common/tools/fonts.dart';
import '../../../../data/models/model.dart';

class ArtistCard extends StatelessWidget {
  const ArtistCard(
      {super.key, required this.viewModelRead, required this.fakeData});

  final HomeScreenViewModel viewModelRead;
  final FakeData fakeData;

  Artist getArtistNameBySpecId(int specId) {
    final _singer = fakeData.artists.firstWhere(
      (song) => song.specId == specId,
    );
    return _singer;
  }

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      sliver: SliverToBoxAdapter(
        child: SizedBox(
          height: 120,
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  viewModelRead
                    ..changeCurrentSingerCardImage(
                        getArtistNameBySpecId(fakeData.musicList[index].id)
                            .urlImage)
                    ..changeCurrentSingeCardName(
                        getArtistNameBySpecId(fakeData.musicList[index].id)
                            .artistName);

                  Navigator.pushNamed(context, "/artists");
                },
                child: SizedBox.square(
                  dimension: 120,
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundImage:
                            NetworkImage(fakeData.musicList[index].urlImage),
                        radius: 45,
                      ),
                      Text(
                        "${getArtistNameBySpecId(fakeData.musicList[index].id).artistName}",
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontFamily: FontFamily.JosefinSans.fFamily,
                                  color: AppColors.blueTextStory,
                                  overflow: TextOverflow.ellipsis,
                                ),
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(width: 10),
            itemCount: 10,
            scrollDirection: Axis.horizontal,
          ),
        ),
      ),
    );
  }
}
