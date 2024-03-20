import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/scheduler/ticker.dart';

import '../models/fake_data.dart';

class HomeScreenViewModel extends ChangeNotifier implements TickerProvider {
  final fakeData = FakeData();

  String? currentSingerImage;

  String? currentMusicName;

  int? currentMusicId;

  String? currentSinger;

  String? currentSingerCardName;
  String? currentSingerCardImage;

  String? currentMusicImage;

  late TabController tabController;

  HomeScreenViewModel() {
    tabController = TabController(length: 2, initialIndex: 0, vsync: this);
  }

  changeCurrentMusicName(String? str) {
    currentMusicName = str;
    notifyListeners();
  }

  changeCurrentMusicId(int? id) {
    currentMusicId = id;
    notifyListeners();
  }

  changeCurrentSingerCardImage(String? str) {
    currentSingerCardImage = str;
    notifyListeners();
  }

  changeCurrentMusicImage(String? str) {
    currentMusicImage = str;
    notifyListeners();
  }

  changeCurrentSinger(String? str) {
    currentSinger = str;
    notifyListeners();
  }

  changeCurrentSingeCardName(String? str) {
    currentSingerCardName = str;
    notifyListeners();
  }

  @override
  Ticker createTicker(onTick) => Ticker(onTick);
}
