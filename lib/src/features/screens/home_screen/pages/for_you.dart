import 'package:flutter/material.dart';
import 'package:music_test/src/data/providers/home_screen_provider.dart';
import 'package:provider/provider.dart';

import '../../../../common/styles/app_colors.dart';
import '../../../../common/tools/fonts.dart';
import '../widgets/mix_card.dart';

class ForYouPage extends StatefulWidget {
  @override
  State<ForYouPage> createState() => _ForYouPageState();
}

class _ForYouPageState extends State<ForYouPage> {
  late HomeScreenViewModel viewModelWatch;
  late HomeScreenViewModel viewModelRead;

  @override
  void didChangeDependencies() {
    viewModelWatch = context.watch<HomeScreenViewModel>();
    viewModelRead = context.read<HomeScreenViewModel>();
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
              child: Text(
                "Recently played",
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontFamily: FontFamily.SpaceGrotesk.fFamily,
                      color: AppColors.white,
                    ),
              ),
            ),
          ),
          //Recently widgets
          SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            sliver: SliverToBoxAdapter(
              child: SizedBox(
                height: 100,
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return SizedBox.square(
                      dimension: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          DecoratedBox(
                            decoration: BoxDecoration(
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
                              padding: EdgeInsets.all(3),
                              child: GestureDetector(
                                onTap: () {
                                  viewModelRead.changeCurrent(
                                      viewModelRead.gridUrls[index]);
                                },
                                child: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      viewModelRead.gridUrls[index]),
                                  radius: 30,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            "Last song",
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
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                childAspectRatio: 0.6,
                mainAxisSpacing: 15,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) => GestureDetector(
                  onTap: () {
                    viewModelRead.currentMix = index;
                    viewModelRead.currentMixArtist =
                        viewModelRead.artisMix[index];

                    Navigator.pushNamed(context, "/mix_page");
                  },
                  child: MixCard(
                    artistName: viewModelWatch.artisMix[index],
                    imagePath: viewModelWatch.gridUrls[index],
                    mixTitle: "Mix ${index + 1}",
                    color: viewModelWatch.colors[index],
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
                  onTap: () =>  viewModelRead.changeCurrent(
                      viewModelRead.gridUrls[index]),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage:
                        NetworkImage(viewModelWatch.gridUrls[index]),
                  ),
                  title: Text(
                    "Mockinbird ",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontFamily: FontFamily.JosefinSans.fFamily,
                          color: AppColors.blueTextStory,
                          overflow: TextOverflow.ellipsis,
                        ),
                  ),
                  subtitle: Text(
                    "Eminem ",
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
          SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            sliver: SliverToBoxAdapter(
              child: SizedBox(
                height: 120,
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        viewModelRead.currentSingerImage =
                            viewModelRead.gridUrls[index];
                        Navigator.pushNamed(context, "/artists");
                      },
                      child: SizedBox.square(
                        dimension: 120,
                        child: Column(
                          children: [
                            CircleAvatar(
                              backgroundImage:
                                  NetworkImage(viewModelRead.gridUrls[index]),
                              radius: 45,
                            ),
                            Text(
                              "Ummon",
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
          //Radio text
          SliverPadding(
            padding: const EdgeInsets.only(top: 20, left: 10, bottom: 15),
            sliver: SliverToBoxAdapter(
              child: Text(
                "Radios",
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
        ],
      ),
    );
  }
}
