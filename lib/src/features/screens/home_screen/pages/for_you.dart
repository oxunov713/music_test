import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:text_marquee/text_marquee.dart';

import '../../../../common/styles/app_colors.dart';
import '../../../../common/tools/fonts.dart';
import '../../../../data/models/fake_data.dart';
import '../../../../data/providers/home_screen_provider.dart';
import '../../../../data/providers/player_provider.dart';
import '../widgets/artist_card.dart';
import '../widgets/mix_card.dart';
import '../widgets/see_more_button.dart';

class ForYouPage extends StatefulWidget {
  @override
  State<ForYouPage> createState() => _ForYouPageState();
}

class _ForYouPageState extends State<ForYouPage> {
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
    return Scaffold(
      backgroundColor: AppColors.dark,
      body: CustomScrollView(
        slivers: [
          //Recently text
          SliverPadding(
            padding: const EdgeInsets.only(top: 15, left: 10),
            sliver: SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Recently played",
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontFamily: FontFamily.SpaceGrotesk.fFamily,
                          color: AppColors.white,
                        ),
                  ),
                  SeeMoreButton(function: () {}, text: "Show all"),
                ],
              ),
            ),
          ),
          //Recently widgets
          SliverPadding(
            padding: const EdgeInsets.only(top: 15, bottom: 15, left: 10),
            sliver: SliverToBoxAdapter(
              child: SizedBox(
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
                                    ..changeCurrentMusicName(fakeData
                                        .artists.values
                                        .elementAt(index)[1])
                                    ..changeCurrentMusicImage(
                                        fakeData.gridUrls[index])
                                    ..changeCurrentSinger(
                                        fakeData.artists.keys.elementAt(index));

                                  playerRead
                                      .playMusic(fakeData.musicsUrl[index][1]);
                                },
                                child: CircleAvatar(
                                  backgroundImage:
                                      NetworkImage(fakeData.gridUrls[index]),
                                  radius: 35,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 72,
                            child: TextMarquee(
                              "${fakeData.artists.values.elementAt(index)[1]}",
                              spaceSize: 30,
                              rtl: false,
                              delay: Duration(seconds: 1),
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    fontFamily: FontFamily.JosefinSans.fFamily,
                                    color: AppColors.blueTextStory,
                                    //overflow: TextOverflow.ellipsis,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 10),
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
          ),
          //Mixes text
          SliverPadding(
            padding: const EdgeInsets.only(top: 15, left: 10),
            sliver: SliverToBoxAdapter(
              child: Text(
                "Made for you",
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontFamily: FontFamily.Montserrat.fFamily,
                      color: AppColors.white,
                    ),
              ),
            ),
          ),
          //Mixes widgets
          SliverPadding(
            padding: const EdgeInsets.only(top: 15, left: 10),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 15,
                childAspectRatio: 0.7,
                mainAxisSpacing: 15,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) => GestureDetector(
                  onTap: () {
                    viewModelRead.currentMixNumber = index;
                    viewModelRead.changeCurrentMixArtists(index);
                    Navigator.pushNamed(context, "/mix_page");
                  },
                  child: MixCard(
                    artistName: viewModelRead.changeCurrentMixArtists(index),
                    imagePath: fakeData.gridUrls[index],
                    mixTitle: "Mix ${index + 1}",
                    color: fakeData.colors[index],
                  ),
                ),
                childCount: 6,
              ),
            ),
          ),
          //Top 10 text
          SliverPadding(
            padding: const EdgeInsets.only(top: 20, left: 10, bottom: 15),
            sliver: SliverToBoxAdapter(
              child: Text(
                "Your top 10 songs",
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontFamily: FontFamily.Jost.fFamily,
                      color: AppColors.white,
                    ),
              ),
            ),
          ),
          //Top 10  songs widgets
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return ListTile(
                  onTap: () {
                    viewModelRead
                      ..changeCurrentMusicName(
                          fakeData.artists.values.elementAt(index)[0])
                      ..changeCurrentMusicImage(fakeData.gridUrls[index])
                      ..changeCurrentSinger(
                          fakeData.artists.keys.elementAt(index));
                  },
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(fakeData.gridUrls[index]),
                  ),
                  title: Text(
                    "${fakeData.artists.values.elementAt(index)[0]} ",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontFamily: FontFamily.JosefinSans.fFamily,
                          color: AppColors.blueTextStory,
                          overflow: TextOverflow.ellipsis,
                        ),
                  ),
                  subtitle: Text(
                    "${fakeData.artists.keys.elementAt(index)} ",
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontFamily: FontFamily.JosefinSans.fFamily,
                          color: AppColors.blueTextStory,
                          overflow: TextOverflow.ellipsis,
                        ),
                  ),
                  trailing: PopupMenuButton(
                    itemBuilder: (context) => [],
                  ),
                );
              },
              childCount: 10,
            ),
          ),
          //Top artist text
          SliverPadding(
            padding: const EdgeInsets.only(top: 20, left: 10, bottom: 15),
            sliver: SliverToBoxAdapter(
              child: Text(
                "Your top 10 artists",
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontFamily: FontFamily.Jost.fFamily,
                      color: AppColors.white,
                    ),
              ),
            ),
          ),
          //Top artist list
          ArtistCard(viewModelRead: viewModelRead, fakeData: fakeData),
          //Radio text
          SliverPadding(
            padding: const EdgeInsets.only(top: 20, left: 10, bottom: 15),
            sliver: SliverToBoxAdapter(
              child: Text(
                "Your Radios",
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontFamily: FontFamily.JosefinSans.fFamily,
                      color: AppColors.white,
                    ),
              ),
            ),
          ),
          //Radio listview
          SliverPadding(
            padding: const EdgeInsets.only(top: 15, bottom: 10),
            sliver: SliverToBoxAdapter(
              child: SizedBox(
                height: 130,
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return SizedBox.square(
                      dimension: 120,
                      child: Column(
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                    "https://visitdpstudio.net/radio_world/upload/96542684-2023-02-15.png"),
                              ),
                            ),
                          ),
                          Text(
                            "Oriat Dono",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  fontFamily: FontFamily.JosefinSans.fFamily,
                                  color: AppColors.blueTextStory,
                                  overflow: TextOverflow.ellipsis,
                                ),
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 10),
                  itemCount: 15,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
          ),
          //Album text
          SliverPadding(
            padding: const EdgeInsets.only(top: 20, left: 10, bottom: 15),
            sliver: SliverToBoxAdapter(
              child: Text(
                "Your Favorite Playlists",
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontFamily: FontFamily.JosefinSans.fFamily,
                      color: AppColors.white,
                    ),
              ),
            ),
          ),
          //Radio listview
          SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            sliver: SliverToBoxAdapter(
              child: SizedBox(
                height: 130,
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return SizedBox.square(
                      dimension: 120,
                      child: Column(
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(fakeData.gridUrls[index]),
                              ),
                            ),
                          ),
                          Text(
                            "Billie's album",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  fontFamily: FontFamily.JosefinSans.fFamily,
                                  color: AppColors.blueTextStory,
                                  overflow: TextOverflow.ellipsis,
                                ),
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 10),
                  itemCount: 15,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
