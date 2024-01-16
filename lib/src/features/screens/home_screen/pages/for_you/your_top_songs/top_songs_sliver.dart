// ignore_for_file: unused_import

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:music_test/src/data/providers/mixes/mixes_provider.dart';
import 'package:music_test/src/data/providers/recently/recently_provider.dart';
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
  final fakeData = FakeData();

  @override
  void didChangeDependencies() {
    viewModelWatch = context.watch<HomeScreenViewModel>();
    viewModelRead = context.read<HomeScreenViewModel>();
    playerRead = context.watch<PlayerViewModel>();
    playerWatch = context.read<PlayerViewModel>();
    provider = context.read<MixProvider>();
    recentlyPlayedProvider = context.read<RecentlyPlayedProvider>();
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
          index = 3 * index;
          return ListTile(
            onTap: () {
print(fakeData.musicList[index].id);
print(viewModelWatch.currentMusicId);
              if (fakeData.musicList[index].id ==
                  viewModelWatch.currentMusicId) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Player(),
                    ));
              } else {
                viewModelRead
                  ..changeCurrentMusicName(fakeData.musicList[index].name)
                  ..changeCurrentMusicImage(fakeData.musicList[index].urlImage)
                  ..changeCurrentMusicId(fakeData.musicList[index].id)
                  ..changeCurrentSinger(
                      getArtistNameBySpecId(fakeData.musicList[index].specId)
                          .artistName);
                Song song = Song(
                    specId: fakeData.musicList[index].specId,
                    urlImage: fakeData.musicList[index].urlImage,
                    id: fakeData.musicList[index].id,
                    name: fakeData.musicList[index].name,
                    url: fakeData.musicList[index].url);
                recentlyPlayedProvider.addSongToRecently(song);
                playerRead.playMusic(fakeData.musicList[index].url);
              }
            },
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(fakeData.musicList[index].urlImage),
            ),
            title: Text(
              "${fakeData.musicList[index].name} ",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            subtitle: Text(
              "${getArtistNameBySpecId(fakeData.musicList[index].specId).artistName} ",
              style: Theme.of(context).textTheme.titleSmall,
            ),
            trailing: PopupMenuButton(
              itemBuilder: (context) => [],
            ),
          );
        },
        childCount: 10,
      ),
    );
  }
}
