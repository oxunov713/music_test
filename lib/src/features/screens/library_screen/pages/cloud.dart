import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../../common/styles/app_colors.dart';
import '../../../../common/tools/fonts.dart';

class LibraryCloud extends StatelessWidget {
  const LibraryCloud({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dark,
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(4.0),
              child: CachedNetworkImage(
                imageUrl: "https://estaticos-cdn.prensaiberica.es/clip/6422556a-ec32-4a86-9e6f-8f8e6b575baa_alta-libre-aspect-ratio_default_0.jpg",
                imageBuilder: (context, imageProvider) => Container(
                  width: 60,
                  height: 60,
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
                    width: 60,
                    height: 60,
                    color: Colors.white,
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            title: Text(
              "Mockinbird",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontFamily: FontFamily.JosefinSans.fFamily,
                color: AppColors.white,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            subtitle: Text(
              "Eminem",
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontFamily: FontFamily.JosefinSans.fFamily,
                color: AppColors.white,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            trailing: PopupMenuButton(
              itemBuilder: (context) => <PopupMenuEntry>[],
            ),
          );
        },
        itemCount: 20,
      ),
    );
  }
}