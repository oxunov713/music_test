import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_test/src/data/models/fake_data.dart';
import 'package:music_test/src/features/screens/home_screen/widgets/artist_card.dart';
import 'package:provider/provider.dart';

import '../../../../../common/styles/app_colors.dart';
import '../../../../../common/tools/fonts.dart';
import '../../../../../data/providers/home_screen_provider.dart';

class TrendingPage extends StatefulWidget {
  const TrendingPage({super.key});

  @override
  State<TrendingPage> createState() => _TrendingPageState();
}

class _TrendingPageState extends State<TrendingPage> {
  late HomeScreenViewModel viewModelWatch;
  late HomeScreenViewModel viewModelRead;

  final fakeData = FakeData();

  @override
  void didChangeDependencies() {
    viewModelWatch = context.watch<HomeScreenViewModel>();
    viewModelRead = context.read<HomeScreenViewModel>();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: CustomScrollView(
        slivers: [
          //Random music
          SliverPadding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            sliver: SliverToBoxAdapter(
              child: GestureDetector(
                onTap: () {},
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: SvgPicture.asset(
                        "assets/images/Pattern - Secondary.svg",
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Welcome to trends",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                  fontFamily: FontFamily.Exo2.fFamily,
                                  color: AppColors.blue80,
                                ),
                          ),
                          SizedBox(height: 50),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 200,
                                child: Text(
                                  "Play a random track ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium
                                      ?.copyWith(
                                          fontFamily:
                                              FontFamily.JosefinSans.fFamily,
                                          color: AppColors.white,
                                          overflow: TextOverflow.fade),
                                ),
                              ),
                              SizedBox(width: 10),
                              Icon(
                                Icons.play_circle,
                                color: AppColors.white,
                                size: 40,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          //Playlists text
          SliverPadding(
            padding: const EdgeInsets.only(top: 20, left: 10, bottom: 15),
            sliver: SliverToBoxAdapter(
              child: Text(
                "Playlists",
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontFamily: FontFamily.JosefinSans.fFamily,
                      color: AppColors.white,
                    ),
              ),
            ),
          ),
          //Playlist listview
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
          //Uzbek text
          SliverPadding(
            padding: const EdgeInsets.only(top: 20, left: 10, bottom: 15),
            sliver: SliverToBoxAdapter(
              child: Text(
                "Uzbek singers",
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontFamily: FontFamily.Jost.fFamily,
                      color: AppColors.white,
                    ),
              ),
            ),
          ),
          //Uzbek list
          ArtistCard(viewModelRead: viewModelRead, fakeData: fakeData),
          //Turkish text
          SliverPadding(
            padding: const EdgeInsets.only(top: 20, left: 10, bottom: 15),
            sliver: SliverToBoxAdapter(
              child: Text(
                "Turkish singers",
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontFamily: FontFamily.Jost.fFamily,
                      color: AppColors.white,
                    ),
              ),
            ),
          ),
          //Turkish list
          ArtistCard(viewModelRead: viewModelRead, fakeData: fakeData),
          //Russian text
          SliverPadding(
            padding: const EdgeInsets.only(top: 20, left: 10, bottom: 15),
            sliver: SliverToBoxAdapter(
              child: Text(
                "Russian singers",
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontFamily: FontFamily.Jost.fFamily,
                      color: AppColors.white,
                    ),
              ),
            ),
          ),
          //Russian list
          ArtistCard(viewModelRead: viewModelRead, fakeData: fakeData),
          //American text
          SliverPadding(
            padding: const EdgeInsets.only(top: 20, left: 10, bottom: 15),
            sliver: SliverToBoxAdapter(
              child: Text(
                "American singers",
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontFamily: FontFamily.Jost.fFamily,
                      color: AppColors.white,
                    ),
              ),
            ),
          ),
          //American list
          ArtistCard(viewModelRead: viewModelRead, fakeData: fakeData),
          //British text
          SliverPadding(
            padding: const EdgeInsets.only(top: 20, left: 10, bottom: 15),
            sliver: SliverToBoxAdapter(
              child: Text(
                "British singers",
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontFamily: FontFamily.Jost.fFamily,
                      color: AppColors.white,
                    ),
              ),
            ),
          ),
          //American list
          ArtistCard(viewModelRead: viewModelRead, fakeData: fakeData),
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
          //Radio
          SliverPadding(
            padding: const EdgeInsets.only(top: 15, ),
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
