import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../../common/styles/app_colors.dart';
import '../../../../../../data/models/fake_data.dart';
import '../../../../../../data/models/model.dart';
import '../../../../../../data/providers/favourite_cloud/favourite_cloud.dart';
import '../../../../../../data/providers/home_screen_provider.dart';
import '../../../../../../data/providers/player/player_provider.dart';
import '../../../../../../data/providers/recently/recently_provider.dart';

class RecentlyList extends StatefulWidget {
  const RecentlyList({super.key});

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
    recentlyPlayedProviderW = context.watch<RecentlyPlayedProvider>();
    favouriteCloudViewModelR = context.read<FavouriteCloudViewModel>();
    favouriteCloudViewModelW = context.watch<FavouriteCloudViewModel>();

    super.didChangeDependencies();
  }

  Artist getArtistNameBySpecId(int specId) {
    final singer = fakeData.artists.firstWhere(
      (song) => song.specId == specId,
    );
    return singer;
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
                          recentlyPlayedProvider.dataBase[index].name)
                      ..changeCurrentMusicId(
                          recentlyPlayedProvider.dataBase[index].id)
                      ..changeCurrentMusicImage(
                          recentlyPlayedProvider.dataBase[index].urlImage)
                      ..changeCurrentSinger(getArtistNameBySpecId(
                              recentlyPlayedProvider.dataBase[index].specId)
                          .artistName);

                    playerRead
                        .playMusic(recentlyPlayedProvider.dataBase[index].url);
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
                    "${recentlyPlayedProvider.dataBase[index].name}",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: (recentlyPlayedProvider.dataBase[index].id ==
                                  viewModelWatch.currentMusicId)
                              ? AppColors.green
                              : Theme.of(context).cardColor,
                        ),
                  ),
                  subtitle: Text(
                    "${getArtistNameBySpecId(recentlyPlayedProvider.dataBase[index].specId).artistName}",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  trailing: PopupMenuButton(
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        onTap: () {
                          //TODO recently ni albumga qo'shish
                        },
                        child: const ListTile(
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
                          bool isSaved =
                              favouriteCloudViewModelW.isSongInFavorites(
                                  recentlyPlayedProviderW.dataBase[index].id);

                          if (isSaved) {
                            favouriteCloudViewModelR.removeSongFromFavorites(
                                recentlyPlayedProviderW.dataBase[index].id);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                duration: Duration(seconds: 1),
                                content: Text("Remove from cloud"),
                              ),
                            );
                          } else {
                            favouriteCloudViewModelR.addToFavorites(
                                recentlyPlayedProviderW.dataBase[index]);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                duration: Duration(seconds: 1),
                                content: Text("Added to cloud"),
                              ),
                            );
                          }
                        },
                        child: favouriteCloudViewModelR.isSongInFavorites(
                                recentlyPlayedProviderW.dataBase[index].id)
                            ? const ListTile(
                                leading: CircleAvatar(
                                  child: Icon(Icons.bookmark),
                                ),
                                title: Text(
                                  "Remove from cloud",
                                  style: TextStyle(color: AppColors.blue),
                                ),
                              )
                            : const ListTile(
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
                                getArtistNameBySpecId(recentlyPlayedProvider
                                        .dataBase[index].specId)
                                    .urlImage)
                            ..changeCurrentSingeCardName(getArtistNameBySpecId(
                                    recentlyPlayedProvider
                                        .dataBase[index].specId)
                                .artistName);

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
                              recentlyPlayedProvider.dataBase[index].id);
                          viewModelRead.changeCurrentMusicId(null);
                          viewModelRead.changeCurrentMusicName(null);
                          viewModelRead.changeCurrentMusicImage(null);
                          playerRead.stopMusic();
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
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox.square(
                    dimension: 100,
                    child: LottieBuilder.asset(
                        "assets/images/Animation - 1710632683344.json"),
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
