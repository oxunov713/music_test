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

  final fakeData = FakeData();

  MixCard({
    Key? key,
    required this.imagePath,
    required this.mixTitle,
    required this.artistName,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.grey800,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: color, width: 2),
      ),
      child: Center(
        child: Column(

          children: [
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.only(left: 4, top: 3),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                            ),
                            child: CustomCached(url: fakeData.gridUrls[0]),
                          ),
                        ),
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(

                              bottomLeft: Radius.circular(10),
                            ),
                            child: CustomCached(url: fakeData.gridUrls[2]),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),

                            ),
                            child: CustomCached(url: fakeData.gridUrls[1]),
                          ),
                        ),
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(

                              bottomRight: Radius.circular(10),
                            ),
                            child: CustomCached(url: fakeData.gridUrls[3]),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  mixTitle,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontFamily: FontFamily.JosefinSans.fFamily,
                    color: color,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
