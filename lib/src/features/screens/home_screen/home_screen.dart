import 'package:flutter/material.dart';

import '../../../common/styles/app_colors.dart';
import 'widgets/custom_appbar.dart';
import 'pages/home_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.dark,
      body: Padding(
        padding: EdgeInsets.only(right: 10, left: 10, top: 40),
        child: Column(
          children: [
            CustomAppBar(),
            SizedBox(height: 20),
            Expanded(
              child: HomeBody(),
            ),
          ],
        ),
      ),
    );
  }
}
