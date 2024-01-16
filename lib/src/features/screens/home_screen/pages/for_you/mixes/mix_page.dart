import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:music_test/src/features/screens/pages/artists.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../../common/styles/app_colors.dart';
import '../../../../../../common/tools/fonts.dart';
import '../../../../../../data/models/fake_data.dart';
import '../../../../../../data/models/model.dart';
import '../../../../../../data/providers/favourite_cloud/favourite_cloud.dart';
import '../../../../../../data/providers/home_screen_provider.dart';
import '../../../../../../data/providers/mixes/mixes_provider.dart';
import '../../../../../../data/providers/player/player_provider.dart';
import '../../../../../../data/providers/recently/recently_provider.dart';
import '../../../../pages/bottom_player.dart';
import '../../../../pages/player.dart';
import 'mix_cache_image.dart';

class MixPage extends StatefulWidget {
  MixPage({
    Key? key,
    required this.mixIndex,
  }) : super(key: key);

  final int mixIndex;

  @override
  State<MixPage> createState() => _MixPageState();
}

class _MixPageState extends State<MixPage> {
  late HomeScreenViewModel homeViewR;
  late HomeScreenViewModel homeViewW;
  late RecentlyPlayedProvider recentlyProviderR;
  late RecentlyPlayedProvider recentlyProviderW;
  late FavouriteCloudViewModel favouriteCloudViewModel;
  late FavouriteCloudViewModel favouriteCloudViewModelW;
  late PlayerViewModel playerViewModelR;
  late PlayerViewModel playerViewModelW;
  late MixProvider mixProviderR;

  final fakeData = FakeData();

  List<Song> mixDataBase = [];
  List<Artist> mixArtists = [];
  List<String> artistsName = [];
  late bool isExistInMix;
  late int _randomNum;

  @override
  void didChangeDependencies() {
    homeViewR = context.read<HomeScreenViewModel>();
    homeViewW = context.watch<HomeScreenViewModel>();
    mixProviderR = context.read<MixProvider>();
    recentlyProviderR = context.read<RecentlyPlayedProvider>();
    recentlyProviderW = context.watch<RecentlyPlayedProvider>();
    favouriteCloudViewModel = context.read<FavouriteCloudViewModel>();
    favouriteCloudViewModelW = context.watch<FavouriteCloudViewModel>();
    playerViewModelR = context.read<PlayerViewModel>();
    playerViewModelW = context.watch<PlayerViewModel>();
    super.didChangeDependencies();
  }

  @override
  void initState() {
    if (!isShuffled) {
      mixDataBase.shuffle();
      isShuffled = true;
    }

    super.initState();
  }

  List<Song> getArtistSongs(List<Artist> artists) {
    List<Song> mixDataBase = [];

    for (var artist in artists) {
      List<Song> songs = getSongsBySpecId(artist.specId);
      mixDataBase.addAll(songs);
    }

    return mixDataBase;
  }

  List<Song> getSongsBySpecId(int specId) {
    return fakeData.musicList.where((song) => song.specId == specId).toList();
  }

  Artist getArtistNameBySpecId(int specId) {
    return fakeData.artists.firstWhere((song) => song.specId == specId);
  }

  void _playPauseAction() {
    if (isExistInMix && playerViewModelW.isPlaying) {
      playerViewModelR.resumePauseMusic();
    } else {
      _playRandomMusic();
    }
  }

  void _playRandomMusic() {
    homeViewR
      ..changeCurrentSinger(
        getArtistNameBySpecId(mixDataBase[_randomNum].specId).artistName,
      )
      ..changeCurrentMusicImage(mixDataBase[_randomNum].urlImage)
      ..changeCurrentMusicName(mixDataBase[_randomNum].name)
      ..changeCurrentMusicId(mixDataBase[_randomNum].id);

    Song song = Song(
      id: mixDataBase[_randomNum].id,
      specId: mixDataBase[_randomNum].specId,
      name: mixDataBase[_randomNum].name,
      urlImage: mixDataBase[_randomNum].urlImage,
      url: mixDataBase[_randomNum].url,
    );

    recentlyProviderR.addSongToRecently(song);

    playerViewModelR.playMusic(mixDataBase[_randomNum].url);
  }

  bool isShuffled = false;

  @override
  Widget build(BuildContext context) {
    mixArtists = mixProviderR.mixArtistsList[widget.mixIndex];
    artistsName = mixArtists.map((artist) => artist.artistName).toList();
    mixDataBase = getArtistSongs(mixArtists);
    _randomNum = Random().nextInt(mixDataBase.length);
    isExistInMix = mixDataBase.any((e) => e.id == homeViewW.currentMusicId);
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                leading: BackButton(color: AppColors.white),
                backgroundColor: AppColors.dark,
                pinned: true,
                automaticallyImplyLeading: false,
                expandedHeight: 350,
                stretch: true,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: false,
                  background: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                    ),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      artistsName.add(mixArtists[index].artistName);

                      return CustomCached(
                        url: mixArtists[index].urlImage,
                      );
                    },
                  ),
                  title: Text(
                    'Mix ${widget.mixIndex + 1}',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontFamily: FontFamily.Jost.fFamily,
                          color: AppColors.white,
                        ),
                  ),
                  expandedTitleScale: 2,
                  collapseMode: CollapseMode.parallax,
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Made for Azizbek Oxunov",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
                                    fontFamily: FontFamily.SpaceGrotesk.fFamily,
                                    color: AppColors.blueTextStory,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                            ),
                            Text(
                              artistsName.join(', '),
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    fontFamily: FontFamily.JosefinSans.fFamily,
                                    color: AppColors.green,
                                    overflow: TextOverflow.fade,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.add_circle_outline,
                                  color: AppColors.green,
                                  size: 35,
                                ),
                              ),
                              SizedBox(width: 15),
                              IconButton(
                                onPressed: () {
                                  //TODO Share ni hamma joyga qo'shish share_plus package
                                },
                                icon: Icon(
                                  Icons.share,
                                  color: AppColors.green,
                                  size: 35,
                                ),
                              ),
                            ],
                          ),
                          IconButton(
                            onPressed: () {
                              _playPauseAction();
                            },
                            icon: Icon(
                              (isExistInMix && playerViewModelW.isPlaying)
                                  ? Icons.pause_circle_filled_outlined
                                  : Icons.play_circle_fill_outlined,
                              color: AppColors.green,
                              size: 50,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.only(bottom: 90),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => ListTile(
                      onTap: () {
                        if (mixDataBase[index].id == homeViewW.currentMusicId) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Player(),
                            ),
                          );
                        } else {
                          homeViewR
                            ..changeCurrentSinger(
                              getArtistNameBySpecId(mixDataBase[index].specId)
                                  .artistName,
                            )
                            ..changeCurrentMusicImage(
                                mixDataBase[index].urlImage)
                            ..changeCurrentMusicName(mixDataBase[index].name)
                            ..changeCurrentMusicId(mixDataBase[index].id);

                          Song song = Song(
                              id: mixDataBase[index].id,
                              specId: mixDataBase[index].specId,
                              name: mixDataBase[index].name,
                              urlImage: mixDataBase[index].urlImage,
                              url: mixDataBase[index].url);

                          recentlyProviderR.addSongToRecently(song);

                          playerViewModelR.playMusic(mixDataBase[index].url);
                        }
                      },
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 5),
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(4.0),
                        child: CachedNetworkImage(
                          imageUrl: mixDataBase[index].urlImage,
                          imageBuilder: (context, imageProvider) => Container(
                            width: 45,
                            height: 45,
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
                              width: 45,
                              height: 45,
                              color: Colors.white,
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                      title: Text(
                        "${mixDataBase[index].name}",
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontFamily: FontFamily.Montserrat.fFamily,
                                  color: (mixDataBase[index].id ==
                                          homeViewW.currentMusicId)
                                      ? AppColors.green
                                      : AppColors.white,
                                  overflow: TextOverflow.ellipsis,
                                ),
                      ),
                      subtitle: Text(
                        getArtistNameBySpecId(mixDataBase[index].specId)
                            .artistName,
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              fontFamily: FontFamily.JosefinSans.fFamily,
                              color: AppColors.white,
                              overflow: TextOverflow.ellipsis,
                            ),
                      ),
                      trailing: SizedBox(
                        width: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              onPressed: () {
                                bool isSaved = favouriteCloudViewModel
                                    .isSongInFavorites(mixDataBase[index].id);

                                if (isSaved) {
                                  favouriteCloudViewModel
                                      .removeSongFromFavorites(
                                          mixDataBase[index].id);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      duration: Duration(milliseconds: 500),
                                      content: Text("Remove from cloud"),
                                    ),
                                  );
                                } else {
                                  favouriteCloudViewModel
                                      .addToFavorites(mixDataBase[index]);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      duration: Duration(milliseconds: 500),
                                      content: Text("Added to cloud"),
                                    ),
                                  );
                                }
                              },
                              icon: Icon(
                                favouriteCloudViewModelW.isSongInFavorites(
                                        mixDataBase[index].id)
                                    ? Icons.bookmark
                                    : Icons.bookmark_border,
                                size: 25,
                              ),
                            ),
                            PopupMenuButton(
                              iconSize: 25,
                              itemBuilder: (context) => [
                                PopupMenuItem(
                                  onTap: () {},
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
                                    homeViewR
                                      ..changeCurrentSingerCardImage(
                                          getArtistNameBySpecId(
                                                  mixDataBase[index].specId)
                                              .urlImage)
                                      ..changeCurrentSingeCardName(
                                          getArtistNameBySpecId(
                                                  mixDataBase[index].specId)
                                              .artistName);

                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Artists(),
                                        ));
                                  },
                                  child: const ListTile(
                                    leading: CircleAvatar(
                                      child: Icon(
                                        Icons.music_note,
                                      ),
                                    ),
                                    title: Text(
                                      "View artist",
                                      style: TextStyle(color: AppColors.blue),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    childCount: mixDataBase.length,
                  ),
                ),
              ),
            ],
          ),
          BottomPlayer(),
        ],
      ),
    );
  }
}
