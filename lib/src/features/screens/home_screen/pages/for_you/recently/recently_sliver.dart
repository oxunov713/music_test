import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:text_marquee/text_marquee.dart';

import '../../../../../../common/styles/app_colors.dart';
import '../../../../../../data/models/fake_data.dart';
import '../../../../../../data/models/model.dart';
import '../../../../../../data/providers/home_screen_provider.dart';
import '../../../../../../data/providers/player/player_provider.dart';
import '../../../../../../data/providers/recently/recently_provider.dart';

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
    int n = 0;
    if (recentlyPlayedProvider.dataBase.length <= 10) {
      n = recentlyPlayedProvider.dataBase.length;
    } else {
      n = 10;
    }
    return n;
  }

  Artist getArtistNameBySpecId(int specId) {
    final singer = fakeData.artists.firstWhere(
      (song) => song.specId == specId,
    );
    return singer;
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
                                    ..changeCurrentMusicId(
                                        recentlyPlayedProvider
                                            .dataBase[index].id)
                                    ..changeCurrentMusicName(
                                        recentlyPlayedProvider
                                            .dataBase[index].name)
                                    ..changeCurrentMusicImage(
                                        recentlyPlayedProvider
                                            .dataBase[index].urlImage)
                                    ..changeCurrentSinger(getArtistNameBySpecId(
                                            recentlyPlayedProvider
                                                .dataBase[index].specId)
                                        .artistName);

                                  playerRead.playMusic(recentlyPlayedProvider
                                      .dataBase[index].url);
                                },
                                onLongPress: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: Text(
                                        "Do you want to delete?",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge
                                            ?.copyWith(
                                                color: Theme.of(context)
                                                    .cardColor),
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            recentlyPlayedProvider
                                                .removeSongFromRecently(
                                                    recentlyPlayedProvider
                                                        .dataBase[index].id);
                                            viewModelRead
                                              ..changeCurrentMusicId(null)
                                              ..changeCurrentMusicName(null)
                                              ..changeCurrentMusicImage(null);
                                            playerRead.stopMusic();
                                            Navigator.pop(context);
                                          },
                                          child: const Text("Delete"),
                                        ),
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: const Text("Back"),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                child: CircleAvatar(
                                  radius: 35,
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        "${recentlyPlayedProvider.dataBase[index].urlImage}",
                                    imageBuilder: (context, imageProvider) =>
                                        Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    placeholder: (context, url) =>
                                        Shimmer.fromColors(
                                      baseColor: Colors.grey[700]!,
                                      highlightColor: Colors.grey[500]!,
                                      child: Container(
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 72,
                            child: Center(
                              child: TextMarquee(
                                "${recentlyPlayedProvider.dataBase[index].name}",
                                spaceSize: 30,
                                rtl: false,
                                delay: const Duration(seconds: 1),
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
            : const Center(
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
