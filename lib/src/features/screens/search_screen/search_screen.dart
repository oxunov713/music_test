import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:music_test/src/common/tools/fonts.dart';

import '../../../common/styles/app_colors.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dark,
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: EdgeInsets.only(right: 10, left: 10, top: 40),
        child: ListView(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              child: TextField(
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.white,
                    ),
                onChanged: (value) {
                  print(value);
                },
                keyboardType: TextInputType.number,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search music,artist,podcasts,albums...',
                  hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.grey800,
                        fontFamily: FontFamily.Exo2?.fFamily,
                      ),
                  fillColor: AppColors.white,
                  filled: true,
                  suffixIcon: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Icon(CupertinoIcons.search)),
                ),
              ),
            ),
            SizedBox(height: 150),
            LottieBuilder.asset("assets/images/Animation - 1700307564690.json")
          ],
        ),
      ),
    );
  }
}
