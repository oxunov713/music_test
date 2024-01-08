import 'package:flutter/material.dart';
import 'package:music_test/src/data/providers/recently/recenlt_provider.dart';
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
  late RecentlyPlayedProvider recentlyPlayedProvider;
  final fakeData = FakeData();

  @override
  void didChangeDependencies() {
    viewModelWatch = context.watch<HomeScreenViewModel>();
    viewModelRead = context.read<HomeScreenViewModel>();
    playerRead = context.watch<PlayerViewModel>();
    playerWatch = context.read<PlayerViewModel>();
    recentlyPlayedProvider = context.read<RecentlyPlayedProvider>();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return ListTile(
            onTap: () {
              viewModelRead
                ..changeCurrentMusicName(
                    fakeData.musicList[index].songs[1].name)
                ..changeCurrentMusicImage(fakeData.musicList[index].urlImage)
                ..changeCurrentSinger(fakeData.musicList[index].artistName);
              MusicModel model = MusicModel(
                id: fakeData.musicList[index].id,
                artistName: fakeData.musicList[index].artistName,
                urlImage: fakeData.musicList[index].urlImage,
                songs: [
                  Song(
                      id: fakeData.musicList[index].songs[1].id,
                      name: fakeData.musicList[index].songs[1].name,
                      url: fakeData.musicList[index].songs[1].url),
                ],
              );
              recentlyPlayedProvider.addSongsToRecently(model);
              playerRead.playMusic(fakeData.musicList[index].songs[1].url);
            },
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(fakeData.musicList[index].urlImage),
            ),
            title: Text(
              "${fakeData.musicList[index].songs[1].name} ",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            subtitle: Text(
              "${fakeData.musicList[index].artistName} ",
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
