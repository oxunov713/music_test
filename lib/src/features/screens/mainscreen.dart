// ignore_for_file: unused_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_test/src/data/providers/mixes/mixes_provider.dart';
import 'package:music_test/src/features/screens/pages/bottom_player.dart';
import 'package:provider/provider.dart';

import '../../common/styles/app_colors.dart';
import 'home_screen/pages/custom_drawer/custom_drawer.dart';
import 'library_screen/library_screen.dart';
import 'search_screen/search_screen.dart';
import 'home_screen/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  late MixProvider mixProvider;
  final List<Widget> _pages = [
    HomeScreen(),
    SearchScreen(),
    LibraryScreen(),
  ];

  @override
  void didChangeDependencies() {
    mixProvider = context.read<MixProvider>();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    mixProvider.getMixArtists();
    return Scaffold(
      body: _pages.elementAt(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/home.svg",
              height: _currentIndex == 0 ? 28 : 26,
              color: _currentIndex == 0
                  ? AppColors.blueTextStory
                  : Theme.of(context).iconTheme.color,
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
    );
  }
}
