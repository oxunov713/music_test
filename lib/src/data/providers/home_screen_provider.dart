import 'package:flutter/material.dart';

import '../models/fake_data.dart';

class HomeScreenViewModel extends ChangeNotifier {
  final fakeData = FakeData();

  int currentMixNumber = 0;

  String currentMixArtists = '';
  String currentSingerImage = '';
  String currentMusicName = '';
  String currentSinger = '';
  String currentSingerCardName = '';
  String currentSingerCardImage = '';

  String currentMusicImage = "";

  changeCurrentMixNumber(int a) {
    currentMixNumber = a;
    notifyListeners();
  }

  String changeCurrentMixArtists(int index) {
    String str1 = fakeData.musicList[index].artistName;
    String str2 = fakeData.musicList[index + 1].artistName;
    String str3 = fakeData.musicList[index + 2].artistName;
    return currentMixArtists = str1 + ', ' + str2 + ', ' + str3 + ' etc.';
  }

  changeCurrentMusicName(String str) {
    currentMusicName = str;
    notifyListeners();
  }

  changeCurrentSingerCardImage(String str) {
    currentSingerCardImage = str;
    notifyListeners();
  }

  changeCurrentMusicImage(String str) {
    currentMusicImage = str;
    notifyListeners();
  }

  changeCurrentSinger(String str) {
    currentSinger = str;
    notifyListeners();
  }

  changeCurrentSingeCardName(String str) {
    currentSingerCardName = str;
    notifyListeners();
  }


}
