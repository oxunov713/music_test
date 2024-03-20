import 'package:flutter/material.dart';

import '../../models/model.dart';

class YourTopSongsProvider extends ChangeNotifier {
  List<Map<int, Song>> _topSongs = [];
  bool _isExistTopSongs = false;

  List<Map<int, Song>> get topSongs => _topSongs;

  bool get isExistTopSongs => _isExistTopSongs;

  void addSong(Song newSong) {
    int n = 0;
    bool _songExist = _topSongs
        .any((songs) => songs.values.any((song) => newSong.id == song.id));
    if(_songExist){
     // _topSongs.a
    }
    _isExistTopSongs = true;
    notifyListeners(); // Notify listeners about the change
  }

  // Method to remove a song from top songs
  void removeSong(Song song) {
    _topSongs.remove(song);
    _isExistTopSongs = _topSongs.isNotEmpty;
    notifyListeners(); // Notify listeners about the change
  }
}
