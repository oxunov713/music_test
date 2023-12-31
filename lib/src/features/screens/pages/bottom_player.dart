import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../../common/styles/app_colors.dart';
import '../../../common/tools/fonts.dart';
import '../../../data/providers/home_screen_provider.dart';
import '../../../data/providers/player_provider.dart';
import 'player.dart';

class BottomPlayer extends StatefulWidget {
  const BottomPlayer({super.key});

  @override
  State<BottomPlayer> createState() => _BottomPlayerState();
}

class _BottomPlayerState extends State<BottomPlayer> {
  late PlayerViewModel pviewModelWatch;
  late PlayerViewModel pviewModelRead;
  late HomeScreenViewModel hviewModelWatch;
  late HomeScreenViewModel hviewModelRead;

  @override
  void didChangeDependencies() {
    pviewModelWatch = context.watch<PlayerViewModel>();
    pviewModelRead = context.read<PlayerViewModel>();
    hviewModelWatch = context.watch<HomeScreenViewModel>();
    hviewModelRead = context.read<HomeScreenViewModel>();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Player(),
          ),
        ),
        child: Container(
          margin: EdgeInsets.only(bottom: 15, right: 10, left: 10),
          height: 70,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [AppColors.blue, AppColors.purpleStory],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CachedNetworkImage(
                      imageUrl: hviewModelWatch.currentImage,
                      imageBuilder: (context, imageProvider) => Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
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

                    ),
                    SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Bu aksam olurum",
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontFamily: FontFamily.Jost.fFamily,
                                    color: AppColors.white,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                        ),
                        Text(
                          "Nahide Babasli",
                          style:
                              Theme.of(context).textTheme.titleSmall?.copyWith(
                                    fontFamily: FontFamily.JosefinSans.fFamily,
                                    color: AppColors.white,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        pviewModelRead.playPause();
                      },
                      icon: Icon(
                        pviewModelWatch.isPlaying
                            ? Icons.pause
                            : Icons.play_arrow_sharp,
                        color: AppColors.white,
                        size: 35,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.skip_next,
                        color: AppColors.white,
                        size: 35,
                      ),
                    ),
                    SizedBox(width: 5),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
