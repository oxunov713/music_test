import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:text_marquee/text_marquee.dart';

import '../../../../../../common/styles/app_colors.dart';
import '../../../../../../common/tools/fonts.dart';
import '../../../../../../data/models/fake_data.dart';
import '../../../../../../data/providers/home_screen_provider.dart';
import '../../../../../../data/providers/player_provider.dart';
import '../../../widgets/see_more_button.dart';

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
    return CustomScrollView(
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
                separatorBuilder: (context, index) => const SizedBox(width: 10),
                itemCount: 10,
                scrollDirection: Axis.horizontal,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
