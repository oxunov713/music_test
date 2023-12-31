import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../../common/styles/app_colors.dart';
import '../../../../common/tools/fonts.dart';
import '../../../../data/providers/home_screen_provider.dart';

class TrendingPage extends StatefulWidget {
  const TrendingPage({super.key});

  @override
  State<TrendingPage> createState() => _TrendingPageState();
}

class _TrendingPageState extends State<TrendingPage> {
  late HomeScreenViewModel viewModelWatch;
  late HomeScreenViewModel viewModelRead;

  @override
  void didChangeDependencies() {
    viewModelWatch = context.watch<HomeScreenViewModel>();
    viewModelRead = context.read<HomeScreenViewModel>();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dark,
      body: CustomScrollView(
        slivers: [
          //Random music
          SliverPadding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            sliver: SliverToBoxAdapter(
              child: GestureDetector(
                onTap: () {},
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: SvgPicture.asset(
                        "assets/images/Pattern - Secondary.svg",
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Welcome to trends",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                  fontFamily: FontFamily.Exo2.fFamily,
                                  color: AppColors.blue80,
                                ),
                          ),
                          SizedBox(height: 50),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 200,
                                child: Text(
                                  "Play a random track ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium
                                      ?.copyWith(
                                          fontFamily:
                                              FontFamily.JosefinSans.fFamily,
                                          color: AppColors.white,
                                          overflow: TextOverflow.fade),
                                ),
                              ),
                              SizedBox(width: 10),
                              Icon(
                                Icons.play_circle,
                                color: AppColors.white,
                                size: 40,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          //Playlists text
          SliverPadding(
            padding: const EdgeInsets.only(top: 20, left: 10, bottom: 15),
            sliver: SliverToBoxAdapter(
              child: Text(
                "Playlists",
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontFamily: FontFamily.JosefinSans.fFamily,
                      color: AppColors.white,
                    ),
              ),
            ),
          ),
          //Playlist listview
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
                                fit: BoxFit.cover,
                                image:
                                    NetworkImage(viewModelRead.gridUrls[index]),
                              ),
                            ),
                          ),
                          Text(
                            "Billie's album",
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
          //Uzbek text
          SliverPadding(
            padding: const EdgeInsets.only(top: 20, left: 10, bottom: 15),
            sliver: SliverToBoxAdapter(
              child: Text(
                "Uzbek singers",
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontFamily: FontFamily.Jost.fFamily,
                      color: AppColors.white,
                    ),
              ),
            ),
          ),
          //Uzbek list
          SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            sliver: SliverToBoxAdapter(
              child: SizedBox(
                height: 120,
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        viewModelRead.currentSingerImage =
                            "https://i.scdn.co/image/ab6761610000e5ebab05bf54edfc5909a8844f64";
                        Navigator.pushNamed(context, "/artists");
                      },
                      child: SizedBox.square(
                        dimension: 120,
                        child: Column(
                          children: [
                            const CircleAvatar(
                              backgroundImage: NetworkImage(
                                  "https://i.scdn.co/image/ab6761610000e5ebab05bf54edfc5909a8844f64"),
                              radius: 45,
                            ),
                            Text(
                              "Shohruhxon",
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
          //Turkish text
          SliverPadding(
            padding: const EdgeInsets.only(top: 20, left: 10, bottom: 15),
            sliver: SliverToBoxAdapter(
              child: Text(
                "Turkish singers",
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontFamily: FontFamily.Jost.fFamily,
                      color: AppColors.white,
                    ),
              ),
            ),
          ),
          //Turkish list
          SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            sliver: SliverToBoxAdapter(
              child: SizedBox(
                height: 120,
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        viewModelRead.currentSingerImage =
                            "https://b6s54eznn8xq.merlincdn.net/Uploads/Films/uzeyir-mehdizade-20231121163749cc1d3d94501443499e3b6efbc55dc19c.jpg";
                        Navigator.pushNamed(context, "/artists");
                      },
                      child: SizedBox.square(
                        dimension: 120,
                        child: Column(
                          children: [
                            const CircleAvatar(
                              backgroundImage: NetworkImage(
                                  "https://b6s54eznn8xq.merlincdn.net/Uploads/Films/uzeyir-mehdizade-20231121163749cc1d3d94501443499e3b6efbc55dc19c.jpg"),
                              radius: 45,
                            ),
                            Text(
                              "Uzeyir Mehdizade",
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
          //Russian text
          SliverPadding(
            padding: const EdgeInsets.only(top: 20, left: 10, bottom: 15),
            sliver: SliverToBoxAdapter(
              child: Text(
                "Russian singers",
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontFamily: FontFamily.Jost.fFamily,
                      color: AppColors.white,
                    ),
              ),
            ),
          ),
          //Russian list
          SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            sliver: SliverToBoxAdapter(
              child: SizedBox(
                height: 120,
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        viewModelRead.currentSingerImage =
                            "https://thisis-images.scdn.co/37i9dQZF1DZ06evO01zPFb-default.jpg";
                        Navigator.pushNamed(context, "/artists");
                      },
                      child: SizedBox.square(
                        dimension: 120,
                        child: Column(
                          children: [
                            const CircleAvatar(
                              backgroundImage: NetworkImage(
                                  "https://thisis-images.scdn.co/37i9dQZF1DZ06evO01zPFb-default.jpg"),
                              radius: 45,
                            ),
                            Text(
                              "Rauf & Faik",
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
          //American text
          SliverPadding(
            padding: const EdgeInsets.only(top: 20, left: 10, bottom: 15),
            sliver: SliverToBoxAdapter(
              child: Text(
                "American singers",
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontFamily: FontFamily.Jost.fFamily,
                      color: AppColors.white,
                    ),
              ),
            ),
          ),
          //American list
          SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            sliver: SliverToBoxAdapter(
              child: SizedBox(
                height: 120,
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        viewModelRead.currentSingerImage =
                            "https://cdn.britannica.com/92/211792-050-E764F875/American-singer-Ariana-Grande-2018.jpg";
                        Navigator.pushNamed(context, "/artists");
                      },
                      child: SizedBox.square(
                        dimension: 120,
                        child: Column(
                          children: [
                            const CircleAvatar(
                              backgroundImage: NetworkImage(
                                  "https://cdn.britannica.com/92/211792-050-E764F875/American-singer-Ariana-Grande-2018.jpg"),
                              radius: 45,
                            ),
                            Text(
                              "Ariana Grande",
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
          //British text
          SliverPadding(
            padding: const EdgeInsets.only(top: 20, left: 10, bottom: 15),
            sliver: SliverToBoxAdapter(
              child: Text(
                "British singers",
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontFamily: FontFamily.Jost.fFamily,
                      color: AppColors.white,
                    ),
              ),
            ),
          ),
          //American list
          SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            sliver: SliverToBoxAdapter(
              child: SizedBox(
                height: 120,
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        viewModelRead.currentSingerImage =
                            "https://avatars.mds.yandex.net/get-kinopoisk-image/1629390/73d0e6ad-7ca3-4d9a-945d-0c625e270d64/220x330";
                        Navigator.pushNamed(context, "/artists");
                      },
                      child: SizedBox.square(
                        dimension: 120,
                        child: Column(
                          children: [
                            const CircleAvatar(
                              backgroundImage: NetworkImage(
                                  "https://avatars.mds.yandex.net/get-kinopoisk-image/1629390/73d0e6ad-7ca3-4d9a-945d-0c625e270d64/220x330"),
                              radius: 45,
                            ),
                            Text(
                              "Dua Lipa",
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
        ],
      ),
    );
  }
}
