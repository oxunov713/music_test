

import 'package:flutter/material.dart';
import 'package:music_test/src/common/styles/app_colors.dart';

import '../../../../common/tools/fonts.dart';

class MixCard extends StatelessWidget {
  final String imagePath;
  final String mixTitle;
  final String artistName;
  final Color color;

  const MixCard({
    Key? key,
    required this.imagePath,
    required this.mixTitle,
    required this.artistName, required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.grey800,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: color)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  mixTitle,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontFamily: FontFamily.JosefinSans.fFamily,
                    color: color,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  artistName,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontFamily: FontFamily.JosefinSans.fFamily,
                    color: AppColors.white,
                    overflow: TextOverflow.ellipsis,
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

