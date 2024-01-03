import 'package:flutter/material.dart';
import 'package:music_test/src/data/models/fake_data.dart';

class HomeScreenViewModel extends ChangeNotifier {
  final fakeData = FakeData();

  int    currentMixNumber = 0;

  String currentMixArtists = '';
  String currentSingerImage = '';
  String currentMusicName = '';
  String currentSinger = '';
  String currentSingerCardName = '';
  String currentSingerCardImage = '';

  String currentMusicImage =
      "https://cdn.iticket.uz/event/poster_square/YkyOkiXJZWwX5ZpfW7abQgpCONrWlC1bTjpqWI5h.jpg";

  changeCurrentMixNumber(int a) {
    currentMixNumber = a;
    notifyListeners();
  }

  String changeCurrentMixArtists(int index) {
    String str1 = fakeData.artists.keys.elementAt(index);
    String str2 = fakeData.artists.keys.elementAt(index + 1);
    String str3 = fakeData.artists.keys.elementAt(index + 2);
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
