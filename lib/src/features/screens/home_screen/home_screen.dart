import 'dart:ui';

import 'package:animated_segmented_tab_control/animated_segmented_tab_control.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../common/styles/app_colors.dart';
import '../../../common/tools/fonts.dart';
import 'pages/custom_drawer/custom_drawer.dart';
import 'pages/for_you/for_you.dart';
import 'pages/trending/trending.dart';
import 'widgets/custom_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: CustomDrawerProfile(),
      body: Padding(
        padding: EdgeInsets.only(right: 10, left: 10, top: 40, bottom: 80),
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
