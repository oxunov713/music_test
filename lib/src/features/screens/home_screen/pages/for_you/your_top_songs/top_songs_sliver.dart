// ignore_for_file: unused_import

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:music_test/src/common/styles/app_colors.dart';
import 'package:music_test/src/data/providers/mixes/mixes_provider.dart';
import 'package:music_test/src/data/providers/recently/recently_provider.dart';
import 'package:music_test/src/data/providers/top_songs/top_songs_provider.dart';
import 'package:music_test/src/features/screens/pages/player.dart';
import 'package:provider/provider.dart';

import '../../../../../../data/models/fake_data.dart';
import '../../../../../../data/models/model.dart';
import '../../../../../../data/providers/home_screen_provider.dart';
import '../../../../../../data/providers/player/player_provider.dart';

class YourTopSongsSliver extends StatefulWidget {
  const YourTopSongsSliver({super.key});

  @override
  State<YourTopSongsSliver> createState() => _YourTopSongsSliverState();
}

class _YourTopSongsSliverState extends State<YourTopSongsSliver> {
  late HomeScreenViewModel viewModelWatch;
  late HomeScreenViewModel viewModelRead;
  late PlayerViewModel playerRead;
  late PlayerViewModel playerWatch;
  late MixProvider provider;
  late RecentlyPlayedProvider recentlyPlayedProvider;
  late YourTopSongsProvider yourTopSongsProvider;
  final fakeData = FakeData();

  @override
  void didChangeDependencies() {
    viewModelWatch = context.watch<HomeScreenViewModel>();
    viewModelRead = context.read<HomeScreenViewModel>();
    playerRead = context.watch<PlayerViewModel>();
    playerWatch = context.read<PlayerViewModel>();
    provider = context.read<MixProvider>();
    recentlyPlayedProvider = context.read<RecentlyPlayedProvider>();
    yourTopSongsProvider = context.watch<YourTopSongsProvider>();
    super.didChangeDependencies();
  }

  Artist getArtistNameBySpecId(int specId) {
    final _singer = fakeData.artists.firstWhere(
      (song) => song.specId == specId,
    );
    return _singer;
  }

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return (yourTopSongsProvider.topSongs.isEmpty)
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox.square(
                        dimension: 100,
                        child: LottieBuilder.asset(
                            "assets/images/Animation - 1710632683344.json"),
                      ),
                      SizedBox(height: 10),
                      TextButton(
                        onPressed: () {
                          viewModelRead.tabController.animateTo(1);
                        },
                        child: Text(
                          "Play something",
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColors.green,
                          ),
                        ),
                      ),
                      Text(
                        "You haven't listen a song yet",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                )
              : ListTile(
                  onTap: () {
                    // onTap logic
                  },
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                        yourTopSongsProvider.topSongs[index].urlImage),
                  ),
                  title: Text(
                    "${yourTopSongsProvider.topSongs[index].name} ",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  subtitle: Text(
                    "${getArtistNameBySpecId(yourTopSongsProvider.topSongs[index].specId).artistName} ",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  trailing: PopupMenuButton(
                    itemBuilder: (context) => [],
                  ),
                );
        },
        childCount: (yourTopSongsProvider.topSongs.isEmpty)
            ? 1
            : min(
                yourTopSongsProvider.topSongs.length,
                10,
              ),
      ),
    );
  }
}
