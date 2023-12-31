import 'package:flutter/material.dart';
import 'package:music_test/src/data/providers/player_provider.dart';
import 'package:provider/provider.dart';

import 'src/app.dart';
import 'src/data/providers/home_screen_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeScreenViewModel()),
        ChangeNotifierProvider(create: (_) => PlayerViewModel()),
      ],
      child: const MyApp(),
    ),
  );
}
