import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:text_marquee/text_marquee.dart';

import '../../../../../../common/styles/app_colors.dart';
import '../../../../../../data/models/fake_data.dart';
import '../../../../../../data/providers/home_screen_provider.dart';
import '../../../../../../data/providers/player/player_provider.dart';
import '../../../../../../data/providers/recently/recenlt_provider.dart';

class RecentlySliver extends StatefulWidget {
  const RecentlySliver({super.key});

  @override
  State<RecentlySliver> createState() => _RecentlySliverState();
}

class _RecentlySliverState extends State<RecentlySliver> {
  late HomeScreenViewModel viewModelWatch;
  late HomeScreenViewModel viewModelRead;
  late PlayerViewModel playerRead;
  late PlayerViewModel playerWatch;
  late RecentlyPlayedProvider recentlyPlayedProvider;
  late RecentlyPlayedProvider recentlyPlayedProviderWatch;
  late int recentlyPlayedSongsLength;

  final fakeData = FakeData();
  int n = 0;

  int _itemCount() {
    int _n = 0;
    if (recentlyPlayedProvider.dataBase.length <= 10) {
      _n = recentlyPlayedProvider.dataBase.length;
    } else {
      _n = 10;
    }
    return _n;
  }

  @override
  void didChangeDependencies() {
    viewModelWatch = context.watch<HomeScreenViewModel>();
    viewModelRead = context.read<HomeScreenViewModel>();
    playerRead = context.watch<PlayerViewModel>();
    playerWatch = context.read<PlayerViewModel>();
    recentlyPlayedProvider = context.read<RecentlyPlayedProvider>();
    recentlyPlayedProviderWatch = context.watch<RecentlyPlayedProvider>();
    recentlyPlayedSongsLength =
        context.watch<RecentlyPlayedProvider>().songsLength;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(top: 15, bottom: 15, left: 10),
      sliver: SliverToBoxAdapter(
        child: (recentlyPlayedProvider.isExistRecently)
            ? SizedBox(
                height: 110,
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: 90,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          DecoratedBox(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  AppColors.purpleStory,
                                  AppColors.blueStory,
                                ],
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(3),
                              child: GestureDetector(
                                onTap: () {
                                  viewModelRead
                                    ..changeCurrentMusicName(
                                        recentlyPlayedProvider
                                            .dataBase[index].songs[0].name)
                                    ..changeCurrentMusicImage(
                                        recentlyPlayedProvider
                                            .dataBase[index].urlImage)
                                    ..changeCurrentSinger(recentlyPlayedProvider
                                        .dataBase[index].artistName);

                                  playerRead.playMusic(recentlyPlayedProvider
                                      .dataBase[index].songs[0].url);
                                },
                                child: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      "${recentlyPlayedProvider.dataBase[index].urlImage}"),
                                  radius: 35,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 72,
                            child: Center(
                              child: TextMarquee(
                                "${recentlyPlayedProvider.dataBase[index].songs[0].name}",
                                spaceSize: 30,
                                rtl: false,
                                delay: Duration(seconds: 1),
                                style: Theme.of(context).textTheme.titleMedium!,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 10),
                  itemCount: _itemCount(),
                  scrollDirection: Axis.horizontal,
                ),
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.music_note,
                      size: 50,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 10),
                    Text(
                      "No recently played songs",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
