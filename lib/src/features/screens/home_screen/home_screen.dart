import 'dart:ui';

import 'package:animated_segmented_tab_control/animated_segmented_tab_control.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:music_test/src/features/screens/pages/bottom_player.dart';
import 'package:shimmer/shimmer.dart';

import '../../../common/styles/app_colors.dart';
import '../../../common/tools/fonts.dart';
import 'pages/custom_drawer.dart';
import 'pages/for_you.dart';
import 'pages/trending.dart';
import 'widgets/custom_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dark,

      endDrawer: CustomDrawerProfile(),
      body: Padding(
        padding: EdgeInsets.only(right: 10, left: 10, top: 40),
        child: Column(
          children: [
            CustomAppBar(),
            SizedBox(height: 20),
            Expanded(
              child: Stack(
                children: [
                  DefaultTabController(
                    length: 2,
                    initialIndex: 0,
                    child: Column(
                      children: [
                        SegmentedTabControl(
                          radius: const Radius.circular(25),
                          backgroundColor: AppColors.dark,
                          splashHighlightColor: AppColors.dark,
                          indicatorColor: AppColors.white30,
                          tabTextColor: AppColors.white80,
                          selectedTabTextColor: AppColors.white80,
                          squeezeIntensity: 2,
                          height: 40,
                          tabPadding: const EdgeInsets.symmetric(horizontal: 8),
                          textStyle:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    fontFamily: FontFamily.Exo2.fFamily,
                                  ),
                          tabs: const [
                            SegmentTab(
                              label: 'For You',
                              selectedTextColor: AppColors.blueTextStory,
                              splashColor: AppColors.dark,
                            ),
                            SegmentTab(
                              label: 'Trending',
                              selectedTextColor: AppColors.blueTextStory,
                              splashColor: Colors.transparent,
                            ),
                          ],
                        ),
                        Expanded(
                          child: TabBarView(
                            physics: NeverScrollableScrollPhysics(),
                            children: [
                              ForYouPage(),
                              TrendingPage(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  //BottomPlayer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
