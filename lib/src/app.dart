import 'package:flutter/material.dart';

import 'features/screens/registration_screen/login_page.dart';
import 'features/screens/registration_screen/sign_up_page.dart';
import 'features/screens/home_screen/pages/bottombar.dart';
import 'features/screens/home_screen/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Do'ppi music",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      routes: {
        '/': (context) => CustomBottombar(),
        '/signup': (context) => SignUp(),
        '/login': (context) => LogInScreen(),
        '/homescreen': (context) => HomeScreen(),
      },
    );
  }
}
