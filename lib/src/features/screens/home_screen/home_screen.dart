import 'dart:ui';

import 'package:animated_segmented_tab_control/animated_segmented_tab_control.dart';
import 'package:flutter/material.dart';
import 'package:music_test/src/data/providers/home_screen_provider.dart';
import 'package:provider/provider.dart';

import '../../../common/styles/app_colors.dart';
import '../pages/bottom_player.dart';
import 'pages/custom_drawer/custom_drawer.dart';
import 'pages/for_you/for_you.dart';
import 'pages/trending/trending.dart';
import 'widgets/custom_appbar.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late HomeScreenViewModel homeScreenViewModel;

  @override
  void didChangeDependencies() {
    homeScreenViewModel = context.watch<HomeScreenViewModel>();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          controller: homeScreenViewModel.tabController,
                          radius: const Radius.circular(25),
                          backgroundColor: Theme.of(context).primaryColor,
                          indicatorColor: Theme.of(context).indicatorColor,
                          tabTextColor:
                              Theme.of(context).textTheme.bodyLarge?.color,
                          squeezeIntensity: 2,
                          height: 40,
                          tabPadding: const EdgeInsets.symmetric(horizontal: 8),
                          textStyle: Theme.of(context).textTheme.bodyLarge,
                          tabs: const [
                            SegmentTab(
                              label: 'For You',
                              selectedTextColor: AppColors.blueTextStory,
                            ),
                            SegmentTab(
                              label: 'Trending',
                              selectedTextColor: AppColors.blueTextStory,
                            ),
                          ],
                        ),
                        Expanded(
                          child: TabBarView(
                            controller:homeScreenViewModel.tabController,
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
                  BottomPlayer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
