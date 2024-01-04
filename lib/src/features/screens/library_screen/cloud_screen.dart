import 'package:flutter/material.dart';

import '../../../common/styles/app_colors.dart';
import '../../../common/tools/fonts.dart';
import 'pages/artists.dart';
import 'pages/cloud.dart';
import 'pages/your_albums.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _LibraryState();
}

class _LibraryState extends State<LibraryScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            labelStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontFamily: FontFamily.SpaceGrotesk.fFamily,
                  color: AppColors.blue,
                ),
            indicatorColor: AppColors.blue,
            dividerColor: Colors.transparent,
            tabs: [
              Tab(text: "Cloud"),
              Tab(text: "Artists"),
              Tab(text: "Your albums"),
            ],
          ),
          centerTitle: true,
          title: Text(
            "Your library",
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontFamily: FontFamily.Rubik.fFamily,
                  color: AppColors.blue,
                ),
          ),

          automaticallyImplyLeading: false,
        ),
        body: TabBarView(children: [
          LibraryCloud(),
          LibraryArtists(),
          LibraryAlbums(),
        ]),
      ),
    );
  }
}
