import 'dart:math';

import 'package:flutter/material.dart';

import '../models/fake_data.dart';

class HomeScreenViewModel extends ChangeNotifier {
  final fakeData = FakeData();

  String? currentSingerImage;

  String? currentMusicName;

  int? currentMusicId;

  String? currentSinger;

  String? currentSingerCardName;
  String? currentSingerCardImage;

  String? currentMusicImage;

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
}
