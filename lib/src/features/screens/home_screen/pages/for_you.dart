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
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
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
                  physics: const BouncingScrollPhysics(),
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
                            style: Theme.of(context)
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
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
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
                (context, index) => MixCard(
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
                "Your top 10 songs",
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontFamily: FontFamily.Jost.fFamily,
                      color: AppColors.white,
                    ),
              ),
            ),
          ),
          //Top 10  songs widgets
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  leading: const CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                        "https://lastfm.freetls.fastly.net/i/u/500x500/fdabed0714898fbf164ecfa0bcfa6ee7.jpg"),
                  ),
                  title: Text(
                    "Mockinbird ",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontFamily: FontFamily.JosefinSans.fFamily,
                          color: AppColors.blueTextStory,
                          overflow: TextOverflow.ellipsis,
                        ),
                  ),
                  subtitle: Text(
                    "Eminem ",
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontFamily: FontFamily.JosefinSans.fFamily,
                          color: AppColors.blueTextStory,
                          overflow: TextOverflow.ellipsis,
                        ),
                  ),
                  trailing: PopupMenuButton(
                    itemBuilder: (context) => [],
                  ),
                );
              },
              childCount: 10,
            ),
          ),
          //Top artist text
          SliverPadding(
            padding: const EdgeInsets.only(top: 20, left: 10, bottom: 15),
            sliver: SliverToBoxAdapter(
              child: Text(
                "Your top 10 artists",
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontFamily: FontFamily.Jost.fFamily,
                      color: AppColors.white,
                    ),
              ),
            ),
          ),
          //Top artist list
          SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            sliver: SliverToBoxAdapter(
              child: SizedBox(
                height: 120,
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => Navigator.pushNamed(context, "/artists"),
                      child: SizedBox.square(
                        dimension: 120,
                        child: Column(
                          children: [
                            const CircleAvatar(
                              backgroundImage: NetworkImage(
                                  "https://cdn.xabardor.uz/media/photo/2023/04/27/news_photo-20230501-171318.webp"),
                              radius: 45,
                            ),
                            Text(
                              "Ummon",
                              style: Theme.of(context)
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
                      ),
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 10),
                  itemCount: 15,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
          ),
          //Radio text
          SliverPadding(
            padding: const EdgeInsets.only(top: 20, left: 10, bottom: 15),
            sliver: SliverToBoxAdapter(
              child: Text(
                "Radios",
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontFamily: FontFamily.JosefinSans.fFamily,
                      color: AppColors.white,
                    ),
              ),
            ),
          ),
          //Radio listview
          SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            sliver: SliverToBoxAdapter(
              child: SizedBox(
                height: 130,
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return SizedBox.square(
                      dimension: 120,
                      child: Column(
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                    "https://visitdpstudio.net/radio_world/upload/96542684-2023-02-15.png"),
                              ),
                            ),
                          ),
                          Text(
                            "Oriat Dono",
                            style: Theme.of(context)
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
                  itemCount: 15,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
