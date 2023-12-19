import 'package:flutter/material.dart';

import '../../../../common/styles/app_colors.dart';
import '../../../../common/tools/fonts.dart';
import '../widgets/mix_card.dart';

class ForYouPage extends StatelessWidget {
  final List<Color> _colors = [
    AppColors.red,
    AppColors.green,
    AppColors.blue,
    AppColors.pink,
    AppColors.orange,
    AppColors.deepPurple,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dark,
      body: CustomScrollView(
        slivers: [
          //Recently text
          SliverPadding(
            padding: const EdgeInsets.only(top: 15, left: 10),
            sliver: SliverToBoxAdapter(
              child: Text(
                "Recently played",
                style: Theme
                    .of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(
                  fontFamily: FontFamily.SpaceGrotesk.fFamily,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
          //Recently widgets
          SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            sliver: SliverToBoxAdapter(
              child: SizedBox(
                height: 100,
                child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return SizedBox.square(
                      dimension: 100,
                      child: Column(
                        children: [
                          const DecoratedBox(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  AppColors.purpleStory,
                                  AppColors.blueStory,
                                ],
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(3),
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    "https://biographe.ru/wp-content/uploads/2021/05/34234342.jpg"),
                                radius: 30,
                              ),
                            ),
                          ),
                          Text(
                            "Last song",
                            style: Theme
                                .of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                              fontFamily: FontFamily.JosefinSans.fFamily,
                              color: AppColors.blueTextStory,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) =>
                  const SizedBox(width: 10),
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
          ),
          //Mixes text
          SliverPadding(
            padding: const EdgeInsets.only(top: 15, left: 10),
            sliver: SliverToBoxAdapter(
              child: Text(
                "Made for you",
                style: Theme
                    .of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(
                  fontFamily: FontFamily.Montserrat.fFamily,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
          //Mixes widgets
          SliverPadding(
            padding: const EdgeInsets.only(top: 15, left: 10),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                childAspectRatio: 0.6,
                mainAxisSpacing: 15,
              ),
              delegate: SliverChildBuilderDelegate(
                    (context, index) =>
                    MixCard(
                      artistName: "Billie,Zivert,Inna etc.",
                      imagePath:
                      "https://yt3.googleusercontent.com/7Yn4iyqLwXrYUk24EYEOUciGEBwuEJpFp4ABj3blSeh_zvWDD46XW3EwaByEhVghr3eVrmTmoA=s900-c-k-c0x00ffffff-no-rj",
                      mixTitle: "Mix ${index + 1}",
                      color: _colors[index],
                    ),
                childCount: 6,
              ),
            ),
          ),
          //Top 10 text
          SliverPadding(
            padding: const EdgeInsets.only(top: 20, left: 10, bottom: 15),
            sliver: SliverToBoxAdapter(
              child: Text(
                "Your top 10 artists",
                style: Theme
                    .of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(
                  fontFamily: FontFamily.Jost.fFamily,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
          //Top 10 widgets
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                return ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  leading: const CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                        "https://lastfm.freetls.fastly.net/i/u/500x500/fdabed0714898fbf164ecfa0bcfa6ee7.jpg"),
                  ),
                  title: Text(
                    "Mockinbird ",
                    style: Theme
                        .of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(
                      fontFamily: FontFamily.JosefinSans.fFamily,
                      color: AppColors.blueTextStory,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  subtitle: Text(
                    "Eminem ",
                    style: Theme
                        .of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(
                      fontFamily: FontFamily.JosefinSans.fFamily,
                      color: AppColors.blueTextStory,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  trailing: PopupMenuButton(
                    itemBuilder:(context) => [],
                  ),
                );
              },
              childCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
