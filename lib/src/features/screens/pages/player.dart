import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../../common/styles/app_colors.dart';
import '../../../common/tools/fonts.dart';
import '../../../data/providers/home_screen_provider.dart';
import '../../../data/providers/player_provider.dart';

class Player extends StatefulWidget {
  const Player({super.key});

  @override
  State<Player> createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  late PlayerViewModel pviewModelWatch;
  late PlayerViewModel pviewModelRead;
  late HomeScreenViewModel hviewModelWatch;
  late HomeScreenViewModel hviewModelRead;
  late AudioPlayer player;

  @override
  void didChangeDependencies() {
    pviewModelWatch = context.watch<PlayerViewModel>();
    pviewModelRead = context.read<PlayerViewModel>();
    hviewModelWatch = context.watch<HomeScreenViewModel>();
    hviewModelRead = context.read<HomeScreenViewModel>();
    player = AudioPlayer();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dark,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.dark,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: AppColors.white,
          ),
        ),
        centerTitle: true,
        title: Text(
          "Playing now",
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: AppColors.white,
                fontFamily: FontFamily.Jost.fFamily,
              ),
        ),
        actionsIconTheme: IconThemeData(color: AppColors.white),
        actions: [
          PopupMenuButton(
            iconSize: 25,
            itemBuilder: (context) => <PopupMenuEntry>[],
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: 30,
          right: 30,
        ),
        child: ListView(
          children: [
            SizedBox(height: 60),
            CachedNetworkImage(
              imageUrl: hviewModelWatch.currentImage,
              imageBuilder: (context, imageProvider) => Container(
                width: double.infinity,
                height: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
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
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Bu aksam olurum",
                      style:
                          Theme.of(context).textTheme.headlineSmall?.copyWith(
                                fontFamily: FontFamily.Jost.fFamily,
                                color: AppColors.white,
                                overflow: TextOverflow.ellipsis,
                              ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Nahide Babasli",
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontFamily: FontFamily.JosefinSans.fFamily,
                            color: AppColors.orange,
                            overflow: TextOverflow.ellipsis,
                          ),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {
                    pviewModelRead.saveMusic();
                  },
                  icon: Icon(
                    pviewModelWatch.isSaved
                        ? Icons.bookmark_border
                        : Icons.bookmark,
                    size: 35,
                    color: AppColors.green,
                  ),
                ),
              ],
            ),
            SizedBox(height: 25),
            StreamBuilder(
              stream: player.positionStream,
              builder: (context, snapshot) {
                return ProgressBar(
                  timeLabelTextStyle: TextStyle(
                      color: AppColors.white,
                      fontFamily: FontFamily.Rubik.fFamily),
                  barHeight: 5,
                  barCapShape: BarCapShape.round,
                  timeLabelPadding: 7,
                  baseBarColor: AppColors.white80,
                  progressBarColor: AppColors.blue50,
                  thumbColor: AppColors.blue50,
                  thumbRadius: 10,
                  thumbGlowRadius: 0,
                  progress: Duration(seconds: 50),
                  total: Duration(seconds: 200),
                  onSeek: (duration) {},
                );
              },
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.skip_previous,
                    size: 45,
                    color: AppColors.white,
                  ),
                ),
                FilledButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(AppColors.purpleStory),
                  ),
                  onPressed: () {
                    pviewModelRead.playPause();
                  },
                  child: Icon(
                    pviewModelWatch.isPlaying
                        ? Icons.pause
                        : Icons.play_arrow_sharp,
                    color: AppColors.green,
                    size: 45,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.skip_next,
                    size: 45,
                    color: AppColors.white,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
