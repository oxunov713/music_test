import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:music_test/src/data/providers/home_screen_provider.dart';
import 'package:music_test/src/features/screens/pages/bottom_player.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../../common/styles/app_colors.dart';
import '../../../common/tools/fonts.dart';
import '../home_screen/widgets/mix_cache_image.dart';

class MixPage extends StatefulWidget {
  const MixPage({super.key});

  @override
  State<MixPage> createState() => _MixPageState();
}

class _MixPageState extends State<MixPage> {
  bool isSaved = false;
  bool isFollow = false;

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
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                leading: BackButton(color: AppColors.white),
                backgroundColor: AppColors.dark,
                pinned: true,
                automaticallyImplyLeading: false,
                expandedHeight: 400,
                stretch: true,
                actions: [
                  PopupMenuButton(
                    iconSize: 25,
                    iconColor: AppColors.white,
                    itemBuilder: (context) => <PopupMenuEntry>[],
                  ),
                ],
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: false,
                  background: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                    ),
                    itemCount: viewModelWatch.gridUrls.length,
                    itemBuilder: (context, index) {
                      return CustomCached(
                        url: viewModelWatch.gridUrls[index],
                      );
                    },
                  ),
                  title: Text(
                    'Mix ${viewModelWatch.currentMix + 1}',
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
                              "${viewModelWatch.currentMixArtist}\n",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    fontFamily: FontFamily.JosefinSans.fFamily,
                                    color: AppColors.green,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                            ),
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
                                onPressed: () {},
                                icon: Icon(
                                  Icons.share,
                                  color: AppColors.green,
                                  size: 35,
                                ),
                              ),
                            ],
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.play_circle_fill_outlined,
                              color: AppColors.green,
                              size: 45,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  childCount: 20,
                  (context, index) => ListTile(
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(4.0),
                      child: CachedNetworkImage(
                        imageUrl:
                            "https://estaticos-cdn.prensaiberica.es/clip/6422556a-ec32-4a86-9e6f-8f8e6b575baa_alta-libre-aspect-ratio_default_0.jpg",
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
                      "Photgraph",
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontFamily: FontFamily.Montserrat.fFamily,
                            color: AppColors.white,
                            overflow: TextOverflow.ellipsis,
                          ),
                    ),
                    subtitle: Text(
                      "Ed Sheeran",
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
                              setState(() {});
                              isSaved = !isSaved;
                            },
                            icon: Icon(
                              isSaved ? Icons.bookmark_border : Icons.bookmark,
                              size: 25,
                            ),
                          ),
                          PopupMenuButton(
                            iconSize: 25,
                            itemBuilder: (context) => <PopupMenuEntry>[],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          BottomPlayer()
        ],
      ),
    );
  }
}
