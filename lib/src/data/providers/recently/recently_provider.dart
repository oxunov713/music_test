import 'package:flutter/material.dart';

import '../../models/model.dart';

class RecentlyPlayedProvider extends ChangeNotifier {
  List<Song> dataBase = [];
  bool isExistRecently = false;
  bool currentRecently = false;
  int songsLength = 0;

  void addSongToRecently(Song newSong) {
    bool songExist = dataBase.any((song) => song.id == newSong.id);

    if (songExist) {
      dataBase
          .remove(dataBase.firstWhere((element) => element.id == newSong.id));
    }

    dataBase.insert(0, newSong);
    songsLength++;
    isExistRecently = true;

    notifyListeners();
  }

  void removeSongFromRecently(int songId) {
    dataBase.removeWhere((song) => song.id == songId);

    isExistRecently = dataBase.isNotEmpty;
    songsLength = dataBase.length;
    notifyListeners();
  }
}
