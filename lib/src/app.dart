import 'package:flutter/material.dart';

import 'features/pages/registration_page/login_page.dart';
import 'features/pages/registration_page/sign_up_page.dart';
import 'features/screens/home_screen/widgets/bottombar.dart';
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
        '/signup': (context) => SignUp(),
        '/login': (context) => LogInScreen(),
        '/homescreen': (context) => HomeScreen(),
        '/home': (context) => CustomBottombar(),
      },
      home: LogInScreen(),
    );
  }
}
