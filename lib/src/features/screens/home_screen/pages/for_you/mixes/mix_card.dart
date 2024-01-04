import 'package:flutter/material.dart';
import 'package:music_test/src/common/styles/app_colors.dart';
import 'package:music_test/src/data/models/fake_data.dart';

import '../../../../common/tools/fonts.dart';
import 'mix_cache_image.dart';

class MixCard extends StatelessWidget {
  final String imagePath;
  final String mixTitle;
  final String artistName;
  final Color color;
  final int index;
  final fakeData = FakeData();

  MixCard({
    Key? key,
    required this.imagePath,
    required this.mixTitle,
    required this.artistName,
    required this.color,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      decoration: BoxDecoration(
        color: AppColors.grey800,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: color, width: 2),
      ),
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
                    CustomCached(url: fakeData.gridUrls[index]),
                    CustomCached(url: fakeData.gridUrls[index + 1]),
                  ],
                ),
                Column(
                  children: [
                    CustomCached(url: fakeData.gridUrls[index + 2]),
                    CustomCached(url: fakeData.gridUrls[index + 3]),
                  ],
                ),
              ],
            ),
          ),
          Text(
            mixTitle,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontFamily: FontFamily.JosefinSans.fFamily,
                  color: color,
                  overflow: TextOverflow.ellipsis,
                ),
          ),
        ],
      ),
    );
  }
}
