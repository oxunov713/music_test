import 'package:flutter/material.dart';

import '../../models/model.dart';

class FavouriteCloudViewModel extends ChangeNotifier {
  List<Song> _favouriteCloud = [];

  List<Song> get favouriteCloud => _favouriteCloud;

  int get songsLength => _favouriteCloud.length;

  bool get isExistCloud => _favouriteCloud.isNotEmpty;

  void addToFavorites(Song song) {
    _favouriteCloud.add(song);
    notifyListeners();
  }

  void removeSongFromFavorites(int songId) {
    _favouriteCloud.removeWhere((song) => song.id == songId);
    notifyListeners();
  }

  bool isSongInFavorites(int songId) {
    return _favouriteCloud.any((song) => song.id == songId);
  }
}
