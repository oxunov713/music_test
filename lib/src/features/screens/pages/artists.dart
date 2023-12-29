import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../common/styles/app_colors.dart';
import '../../../common/tools/fonts.dart';

class Artists extends StatefulWidget {
  const Artists({super.key});

  @override
  State<Artists> createState() => _ArtistsState();
}

class _ArtistsState extends State<Artists> {
  bool isSaved = false;
  bool isFollow = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dark,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: BackButton(color: AppColors.white),
            backgroundColor: AppColors.dark,
            pinned: true,
            automaticallyImplyLeading: false,
            expandedHeight: 260,
            stretch: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: false,
              background: CachedNetworkImage(
                imageUrl:
                    "https://www.apple.com/newsroom/images/product/music/standard/Apple-Music-Live-Ed-Sheeran-with-guitar_big.jpg.slideshow-xlarge_2x.jpg",
                imageBuilder: (context, imageProvider) => Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
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
              title: Text(
                'Ed Sheeran',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontFamily: FontFamily.Jost.fFamily,
                      color: AppColors.white,
                    ),
              ),
              expandedTitleScale: 2,
              collapseMode: CollapseMode.parallax,
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            sliver: SliverToBoxAdapter(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      "23,000,12 monthly listeners",
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontFamily: FontFamily.JosefinSans.fFamily,
                            color: AppColors.green,
                            overflow: TextOverflow.ellipsis,
                          ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          OutlinedButton(
                            onPressed: () {
                              setState(() {
                                isFollow = !isFollow;
                              });
                            },
                            child: Text(
                              isFollow ? "Follow" : "Following",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                    fontFamily: FontFamily.JosefinSans.fFamily,
                                    color: AppColors.green,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                            ),
                          ),
                          SizedBox(width: 15),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.share,
                              color: AppColors.green,
                              size: 35,
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.play_circle_fill_outlined,
                          color: AppColors.green,
                          size: 45,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 20,
              (context, index) => ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(4.0),
                  child: CachedNetworkImage(
                    imageUrl:
                        "https://estaticos-cdn.prensaiberica.es/clip/6422556a-ec32-4a86-9e6f-8f8e6b575baa_alta-libre-aspect-ratio_default_0.jpg",
                    imageBuilder: (context, imageProvider) => Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
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
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
                title: Text(
                  "Photgraph",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontFamily: FontFamily.Montserrat.fFamily,
                        color: AppColors.white,
                        overflow: TextOverflow.ellipsis,
                      ),
                ),
                subtitle: Text(
                  "Ed Sheeran",
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontFamily: FontFamily.JosefinSans.fFamily,
                        color: AppColors.white,
                        overflow: TextOverflow.ellipsis,
                      ),
                ),
                trailing: SizedBox(
                  width: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {});
                          isSaved = !isSaved;
                        },
                        icon: Icon(
                          isSaved ? Icons.bookmark_border : Icons.bookmark,
                          size: 25,
                        ),
                      ),
                      PopupMenuButton(
                        iconSize: 25,
                        itemBuilder: (context) => <PopupMenuEntry>[],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
