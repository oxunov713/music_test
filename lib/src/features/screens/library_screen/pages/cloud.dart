import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../../common/styles/app_colors.dart';
import '../../../../common/tools/fonts.dart';
import '../../../../data/providers/favourite_cloud/favourite_cloud.dart';

class LibraryCloud extends StatefulWidget {
  const LibraryCloud({super.key});

  @override
  State<LibraryCloud> createState() => _LibraryCloudState();
}

class _LibraryCloudState extends State<LibraryCloud> {
  late FavouriteCloudViewModel favouriteCloudViewModel;

  @override
  void didChangeDependencies() {
    favouriteCloudViewModel = context.read<FavouriteCloudViewModel>();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: favouriteCloudViewModel.isExistCloud
          ? ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(4.0),
              child: CachedNetworkImage(
                imageUrl:
                "${favouriteCloudViewModel.favouriteCloud[index].urlImage}",
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

                    color:AppColors.grey800,
                  ),
                ),
                errorWidget: (context, url, error) =>
                const Icon(Icons.error),
              ),
            ),
            title: Text(
              "${favouriteCloudViewModel.favouriteCloud[index].songs[0].name}",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontFamily: FontFamily.JosefinSans.fFamily,
                color: AppColors.white,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            subtitle: Text(
              "${favouriteCloudViewModel.favouriteCloud[index].artistName}",
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontFamily: FontFamily.JosefinSans.fFamily,
                color: AppColors.white,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            trailing: PopupMenuButton(
              itemBuilder: (context) => [
                // Add your PopupMenuItems based on user actions
              ],
            ),
          );
        },
        itemCount: favouriteCloudViewModel.songsLength,
      )
          : Center(
        child: Text("No music"),
      ),
    );
  }
}
