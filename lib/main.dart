import 'package:flutter/material.dart';
import 'package:music_test/src/app.dart';
import 'package:music_test/src/data/providers/mixes/mixes_provider.dart';
import 'package:music_test/src/data/providers/top_songs/top_songs_provider.dart';
import 'package:provider/provider.dart';

import 'src/data/providers/favourite_cloud/favourite_cloud.dart';
import 'src/data/providers/greating/greating_provider.dart';
import 'src/data/providers/home_screen_provider.dart';
import 'src/data/providers/player/player_provider.dart';
import 'src/data/providers/recently/recently_provider.dart';
import 'src/data/providers/theme/theme_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeScreenViewModel()),
        ChangeNotifierProvider(create: (_) => PlayerViewModel()),
        ChangeNotifierProvider(create: (_) => GreatingViewModel()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => RecentlyPlayedProvider()),
        ChangeNotifierProvider(create: (_) => FavouriteCloudViewModel()),
        ChangeNotifierProvider(create: (_) => MixProvider()),
        ChangeNotifierProvider(create: (_) => YourTopSongsProvider()),
      ],
      child: const MyApp(),
    ),
  );
}
