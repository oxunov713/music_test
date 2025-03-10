import 'package:flutter/material.dart';
import 'package:music_test/src/data/providers/theme/theme_provider.dart';
import 'package:provider/provider.dart';

import 'features/screens/pages/artists.dart';
import 'features/screens/registration_screen/login_page.dart';
import 'features/screens/registration_screen/sign_up_page.dart';
import 'features/screens/mainscreen.dart';
import 'features/screens/home_screen/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Sonic Vibe",
      debugShowCheckedModeBanner: false,
      theme: context.watch<ThemeProvider>().themeData,
      routes: {
        '/': (context) => MainScreen(),
        '/signup': (context) => SignUp(),
        '/login': (context) => LogInScreen(),
        '/homescreen': (context) => HomeScreen(),
        '/artists': (context) => Artists(),
      },
    );
  }
}
