import 'package:flutter/material.dart';

import '../../models/model.dart';

class FavouriteCloudViewModel extends ChangeNotifier {
  List<MusicModel> favouriteCloud = [];
  int songsLength = 0;

  bool get isExistCloud => favouriteCloud.isNotEmpty;

  void addToFavorites(MusicModel currentModel) {
    bool artistExists =
        favouriteCloud.any((model) => model.id == currentModel.id);

    if (artistExists) {
      int artistIndex =
          favouriteCloud.indexWhere((model) => model.id == currentModel.id);
      List<Song> existingSongs = favouriteCloud[artistIndex].songs;

      for (var newSong in currentModel.songs) {
        bool songExists = existingSongs.any((song) => song.id == newSong.id);

        if (!songExists) {
          favouriteCloud[artistIndex].songs.add(currentModel.songs.first);
          songsLength++;
        }
      }
    } else {
      favouriteCloud.add(currentModel);
      songsLength++;
    }

    favouriteCloud.sort((a, b) => b.id.compareTo(a.id));

    notifyListeners();
  }

  void removeSongFromFavorites(int songId) {
    favouriteCloud.forEach((musicModel) {
      musicModel.songs.removeWhere((song) => song.id == songId);
      songsLength -= musicModel.songs.length;
    });

    favouriteCloud.removeWhere((musicModel) => musicModel.songs.isEmpty);

    notifyListeners();
  }


  bool isSongInFavorites(int songId) {
    for (var musicModel in favouriteCloud) {
      for (var song in musicModel.songs) {
        if (song.id == songId) {
          return true;
        }
      }
    }
    return false;
  }
}
