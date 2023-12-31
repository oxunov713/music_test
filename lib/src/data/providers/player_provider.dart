import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class PlayerViewModel extends ChangeNotifier {
  bool isPlaying = false;
  bool isSaved = false;

  playPause() {
    isPlaying = !isPlaying;
    notifyListeners();
  }

  playMusic(AudioPlayer player, String str) async {
    await player.setUrl(str);
    player.play();

    notifyListeners();
  }

  pauseMusic(AudioPlayer player) {
    player.pause();
    notifyListeners();
  }

  saveMusic() {
    isSaved = !isSaved;
    notifyListeners();
  }
}
