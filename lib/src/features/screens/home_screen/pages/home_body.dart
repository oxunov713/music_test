import 'package:animated_segmented_tab_control/animated_segmented_tab_control.dart';
import 'package:flutter/material.dart';

import '../../../../common/styles/app_colors.dart';
import '../../../../common/tools/fonts.dart';
import 'for_you.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Column(
        children: [
          SegmentedTabControl(
            radius: const Radius.circular(25),
            backgroundColor: AppColors.dark,
            indicatorColor: AppColors.white30,
            tabTextColor: AppColors.white80,
            selectedTabTextColor: AppColors.white80,
            squeezeIntensity: 2,
            height: 40,
            tabPadding: const EdgeInsets.symmetric(horizontal: 8),
            textStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontFamily: FontFamily.Exo2.fFamily,
                ),
            tabs: const [
              SegmentTab(
                label: 'For You',
                selectedTextColor: AppColors.blueTextStory,
                splashColor: Colors.transparent,
              ),
              SegmentTab(
                label: 'Trending',
                selectedTextColor: AppColors.blueTextStory,
                splashColor: Colors.transparent,
              ),
            ],
          ),
          // Sample pages
          Expanded(
            child: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              children: [
                ForYouPage(),
                Scaffold(
                  backgroundColor: AppColors.dark,
                  body: Center(
                    child: Text("Music 1"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
