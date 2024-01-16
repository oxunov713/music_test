// ignore_for_file: unused_import

import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../../common/styles/app_colors.dart';
import '../../../common/tools/fonts.dart';
import '../../../data/providers/home_screen_provider.dart';
import '../../../data/providers/player/player_provider.dart';

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
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
          ),
        ),
        centerTitle: true,
        title: Text(
          "Playing now",
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Theme.of(context).cardColor,
                fontFamily: FontFamily.Jost.fFamily,
              ),
        ),
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
              imageUrl: hviewModelWatch.currentMusicImage ?? "",
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
                      "${hviewModelWatch.currentMusicName}",
                      style:
                          Theme.of(context).textTheme.headlineSmall?.copyWith(
                                fontFamily: FontFamily.Jost.fFamily,
                                overflow: TextOverflow.ellipsis,
                              ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "${hviewModelWatch.currentSinger}",
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
                stream: pviewModelRead.player.onPositionChanged,
                builder: (context, snapshot) {
                  return ProgressBar(
                    timeLabelTextStyle: TextStyle(
                        fontFamily: FontFamily.Rubik.fFamily,
                        color: Theme.of(context).cardColor,
                        fontWeight: FontWeight.bold),
                    barHeight: 5,
                    barCapShape: BarCapShape.round,
                    timeLabelPadding: 7,
                    baseBarColor:
                        Theme.of(context).primaryColor.withOpacity(0.5),
                    progressBarColor: AppColors.blue50,
                    thumbColor: AppColors.blue50,
                    thumbRadius: 10,
                    thumbGlowRadius: 0,
                    progress: snapshot.data ?? Duration.zero,
                    total: pviewModelWatch.currentDuration ?? Duration.zero,
                    onSeek: (duration) {
                      pviewModelRead.player.seek(duration);
                    },
                  );
                }),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.skip_previous,
                    size: 45,
                  ),
                ),
                FilledButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(AppColors.purpleStory),
                  ),
                  onPressed: () {
                    pviewModelRead.resumePauseMusic();
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
