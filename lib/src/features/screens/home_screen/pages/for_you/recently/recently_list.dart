import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:music_test/src/common/styles/app_colors.dart';
import 'package:music_test/src/data/providers/recently/recenlt_provider.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../../data/models/fake_data.dart';
import '../../../../../../data/providers/favourite_cloud/favourite_cloud.dart';
import '../../../../../../data/providers/home_screen_provider.dart';
import '../../../../../../data/providers/player/player_provider.dart';

class RecentlyList extends StatefulWidget {
  RecentlyList({super.key});

  @override
  State<RecentlyList> createState() => _RecentlyListState();
}

class _RecentlyListState extends State<RecentlyList> {
  late HomeScreenViewModel viewModelWatch;
  late HomeScreenViewModel viewModelRead;
  late PlayerViewModel playerRead;
  late PlayerViewModel playerWatch;
  late RecentlyPlayedProvider recentlyPlayedProvider;
  late RecentlyPlayedProvider recentlyPlayedProviderW;
  late FavouriteCloudViewModel favouriteCloudViewModelR;
  late FavouriteCloudViewModel favouriteCloudViewModelW;

  final fakeData = FakeData();

  @override
  void didChangeDependencies() {
    viewModelWatch = context.watch<HomeScreenViewModel>();
    viewModelRead = context.read<HomeScreenViewModel>();
    playerRead = context.watch<PlayerViewModel>();
    playerWatch = context.read<PlayerViewModel>();
    recentlyPlayedProvider = context.read<RecentlyPlayedProvider>();
    favouriteCloudViewModelR = context.read<FavouriteCloudViewModel>();
    favouriteCloudViewModelW = context.watch<FavouriteCloudViewModel>();
    recentlyPlayedProviderW = context.watch<RecentlyPlayedProvider>();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Recently played songs"),
      ),
      body: recentlyPlayedProvider.isExistRecently
          ? ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    viewModelRead
                      ..changeCurrentMusicName(
                          recentlyPlayedProvider.dataBase[index].songs[0].name)
                      ..changeCurrentMusicImage(
                          recentlyPlayedProvider.dataBase[index].urlImage)
                      ..changeCurrentSinger(
                          recentlyPlayedProvider.dataBase[index].artistName);

                    playerRead.playMusic(
                        recentlyPlayedProvider.dataBase[index].songs[0].url);
                  },
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(4.0),
                    child: CachedNetworkImage(
                      imageUrl: recentlyPlayedProvider.dataBase[index].urlImage,
                      imageBuilder: (context, imageProvider) => Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      placeholder: (context, url) => Shimmer.fromColors(
                        baseColor: Colors.grey[700]!,
                        highlightColor: Colors.grey[500]!,
                        child: Container(
                          width: 60,
                          height: 60,
                          color: Colors.white,
                        ),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                  title: Text(
                    "${recentlyPlayedProvider.dataBase[index].songs.first.name}",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: (viewModelRead.currentMusicName ==
                                  recentlyPlayedProvider
                                      .dataBase[index].songs[0].name)
                              ? AppColors.green
                              : Theme.of(context).cardColor,
                        ),
                  ),
                  subtitle: Text(
                    "${recentlyPlayedProvider.dataBase[index].artistName}",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  trailing: PopupMenuButton(
                    itemBuilder: (context) => [
                      const PopupMenuItem(
                        child: ListTile(
                          leading: CircleAvatar(
                            child: Icon(Icons.add_outlined),
                          ),
                          title: Text(
                            "Add to PlayList",
                            style: TextStyle(color: AppColors.blue),
                          ),
                        ),
                      ),
                      PopupMenuItem(
                        onTap: () {
                          bool isSaved = favouriteCloudViewModelW
                              .isSongInFavorites(recentlyPlayedProvider
                                  .dataBase[index].songs.first.id);

                          isSaved
                              ? favouriteCloudViewModelR
                                  .removeSongFromFavorites(
                                      recentlyPlayedProviderW
                                          .dataBase[index].songs.first.id)
                              : favouriteCloudViewModelR.addToFavorites(
                                  recentlyPlayedProviderW.dataBase[index]);
                        },
                        child: favouriteCloudViewModelR.isSongInFavorites(
                                recentlyPlayedProviderW
                                    .dataBase[index].songs.first.id)
                            ? ListTile(
                                leading: CircleAvatar(
                                  child: Icon(Icons.bookmark),
                                ),
                                title: Text(
                                  "Remove from cloud",
                                  style: TextStyle(color: AppColors.blue),
                                ),
                              )
                            : ListTile(
                                leading: CircleAvatar(
                                  child: Icon(Icons.bookmark_border),
                                ),
                                title: Text(
                                  "Add to cloud",
                                  style: TextStyle(color: AppColors.blue),
                                ),
                              ),
                      ),
                      PopupMenuItem(
                        onTap: () {
                          viewModelRead
                            ..changeCurrentSingerCardImage(
                                recentlyPlayedProvider.dataBase[index].urlImage)
                            ..changeCurrentSingeCardName(
                              recentlyPlayedProvider.dataBase[index].artistName,
                            );

                          Navigator.pushNamed(context, "/artists");
                        },
                        child: const ListTile(
                          leading: CircleAvatar(
                            child: Icon(Icons.music_note),
                          ),
                          title: Text(
                            "View artist",
                            style: TextStyle(color: AppColors.blue),
                          ),
                        ),
                      ),
                      PopupMenuItem(
                        onTap: () {
                          recentlyPlayedProvider.removeSongFromRecently(
                              recentlyPlayedProvider
                                  .dataBase[index].songs.first.id);
                        },
                        child: const ListTile(
                          leading: CircleAvatar(
                            child: Icon(Icons.remove_circle_outline),
                          ),
                          title: Text(
                            "Remove recently",
                            style: TextStyle(color: AppColors.blue),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              itemCount: recentlyPlayedProviderW.dataBase.length,
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
    );
  }
}
