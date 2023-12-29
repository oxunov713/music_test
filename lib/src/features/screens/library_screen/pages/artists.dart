import 'package:flutter/material.dart';

import '../../../../common/styles/app_colors.dart';
import '../../../../common/tools/fonts.dart';

class LibraryArtists extends StatelessWidget {
  const LibraryArtists({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dark,
      body: ListView.builder(
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(10),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            leading: const CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(
                  "https://cdn.iticket.uz/event/poster_square/x88aXXGkbVOdwh9aMii1ochrbZSC4bzo13j7ow51.jpg"),
            ),
            title: Text(
              "Nahide Bababasli ",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontFamily: FontFamily.Montserrat.fFamily,
                    color: AppColors.white,
                    overflow: TextOverflow.ellipsis,
                  ),
            ),
          ),
        ),
        itemCount: 20,
      ),
    );
  }
}
