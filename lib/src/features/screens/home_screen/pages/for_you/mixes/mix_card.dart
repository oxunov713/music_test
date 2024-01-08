import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../../../common/styles/app_colors.dart';
import '../../../../../../common/tools/fonts.dart';
import '../../../../../../data/models/fake_data.dart';
import 'mix_cache_image.dart';

class MixCard extends StatelessWidget {
  final String imagePath;
  final String mixTitle;
  final String artistName;

  final int index;
  final fakeData = FakeData();

  MixCard({
    Key? key,
    required this.imagePath,
    required this.mixTitle,
    required this.artistName,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.blue, width: 2),
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(fakeData.musicList[index].urlImage),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: BackdropFilter(
          blendMode: BlendMode.srcIn,
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 120,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        CustomCached(url: fakeData.musicList[index].urlImage),
                        CustomCached(
                            url: fakeData.musicList[index + 1].urlImage),
                      ],
                    ),
                    Column(
                      children: [
                        CustomCached(
                            url: fakeData.musicList[index + 2].urlImage),
                        CustomCached(
                            url: fakeData.musicList[index + 3].urlImage),
                      ],
                    ),
                  ],
                ),
              ),
              Text(
                mixTitle,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontFamily: FontFamily.JosefinSans.fFamily,
                    color: fakeData.colors[index],
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
