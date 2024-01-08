import 'package:flutter/material.dart';

import '../../models/model.dart';

class RecentlyPlayedProvider extends ChangeNotifier {
  List<MusicModel> dataBase = [];
  bool isExistRecently = false;
  int songsLength = 0;

  void addSongsToRecently(MusicModel currentModel) {
    bool artistExists = dataBase.any((model) => model.id == currentModel.id);

    if (artistExists) {
      int artistIndex =
          dataBase.indexWhere((model) => model.id == currentModel.id);
      List<Song> existingSongs = dataBase[artistIndex].songs;

      for (var newSong in currentModel.songs) {
        bool songExists = existingSongs.any((song) => song.id == newSong.id);

        if (!songExists) {
          dataBase[artistIndex].songs.add(currentModel.songs.first);
          songsLength++;
        }
      }
    } else {
      isExistRecently = true;
      dataBase.add(currentModel);
      songsLength++;
    }
    dataBase.sort((a, b) => b.id.compareTo(a.id));
    notifyListeners();
  }

  void removeSongFromRecently(int songId) {
    for (int i = 0; i < dataBase.length; i++) {
      List<Song> songs = dataBase[i].songs;
      for (int j = 0; j < songs.length; j++) {
        if (songs[j].id == songId) {
          songs.removeAt(j);
          songsLength--;
          if (songs.isEmpty) {
            dataBase.removeAt(i);
            if (dataBase.isEmpty) {
              isExistRecently = false;
            }
          }
        }
      }
    }
    notifyListeners();
  }
}
