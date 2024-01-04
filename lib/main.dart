import 'package:flutter/material.dart';
import 'package:music_test/src/data/providers/player_provider.dart';
import 'package:music_test/src/data/providers/theme_provider.dart';
import 'package:provider/provider.dart';

import 'src/app.dart';
import 'src/data/providers/greating_provider.dart';
import 'src/data/providers/home_screen_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeScreenViewModel()),
        ChangeNotifierProvider(create: (_) => PlayerViewModel()),
        ChangeNotifierProvider(create: (_) => GreatingViewModel()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}
