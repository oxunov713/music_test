import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../data/models/fake_data.dart';
import '../../../../../../data/providers/home_screen_provider.dart';
import '../../../../../../data/providers/player_provider.dart';

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

  final fakeData = FakeData();

  @override
  void didChangeDependencies() {
    viewModelWatch = context.watch<HomeScreenViewModel>();
    viewModelRead = context.read<HomeScreenViewModel>();
    playerRead = context.watch<PlayerViewModel>();
    playerWatch = context.read<PlayerViewModel>();
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
                    fakeData.artists.values.elementAt(index)[0])
                ..changeCurrentMusicImage(fakeData.gridUrls[index])
                ..changeCurrentSinger(fakeData.artists.keys.elementAt(index));
            },
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(fakeData.gridUrls[index]),
            ),
            title: Text(
              "${fakeData.artists.values.elementAt(index)[0]} ",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            subtitle: Text(
              "${fakeData.artists.keys.elementAt(index)} ",
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
