import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../common/styles/app_colors.dart';
import '../../library_screen/cloud_screen.dart';
import '../../search_screen/search_screen.dart';
import '../home_screen.dart';

class CustomBottombar extends StatefulWidget {
  const CustomBottombar({super.key});

  @override
  _CustomBottombarState createState() => _CustomBottombarState();
}

class _CustomBottombarState extends State<CustomBottombar> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    SearchScreen(),
    Library(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages.elementAt(_currentIndex),
      bottomNavigationBar: Container(
        color: Colors.transparent,
        child: BottomNavigationBar(
          backgroundColor: AppColors.dark,
          unselectedItemColor: AppColors.white80,
          fixedColor: AppColors.blueTextStory,
          items: [
            BottomNavigationBarItem(
              icon: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  _currentIndex == 0
                      ? AppColors.blueTextStory
                      : AppColors.white80,
                  BlendMode.srcIn,
                ),
                child: SvgPicture.asset(
                  "assets/icons/home.svg",
                  height: _currentIndex == 0 ? 28 : 26,
                ),
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.search,
                  size: (_currentIndex == 1) ? 28 : 26),
              label: "Search",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.library_music_outlined,
                  size: (_currentIndex == 2) ? 28 : 26),
              label: "Library",
            ),
          ],
          currentIndex: _currentIndex,
          onTap: (value) {
            setState(() {
              _currentIndex = value;
            });
          },
        ),
      ),
    );
  }
}
