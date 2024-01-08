import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class PlayerViewModel extends ChangeNotifier {
  bool isPlaying = false;
  bool isSaved = false;

  late Source currentMusUrl;

  AudioPlayer player = AudioPlayer();
  Duration? currentDuration = Duration.zero;

  resumePauseMusic() {
    if (isPlaying) {
      player.pause();
      isPlaying = false;
    } else {
      player.resume();

      isPlaying = true;
    }

    notifyListeners();
  }

  playMusic(String url) async {
    await player.stop();
    await player.play(
      UrlSource(
          "https://storage.googleapis.com/musicapp-api/Songs/Nahide_Babashl%C4%B1_-_Bu_Ak%C5%9Fam_%C3%96l%C3%BCr%C3%BCm__256kbps_cbr_.mp3?X-Goog-Algorithm=GOOG4-RSA-SHA256&X-Goog-Credential=music-api%40protean-willow-407916.iam.gserviceaccount.com%2F20240107%2Fauto%2Fstorage%2Fgoog4_request&X-Goog-Date=20240107T130533Z&X-Goog-Expires=86400&X-Goog-SignedHeaders=host&X-Goog-Signature=6469c1cec8b54c4380ce496220d1b30515d9d284401dd03c6bc90ca04529355c01d5bc77f4fc3985e385da6cf25679c875cf40d75cc7a199ded946b37e85130e17df8a901a528b8964d2482ad277b22c9efa93dd891ef8c74577de0ffbc79740f33f88825badbcdbf16a9ef6f75c1df3397119a11cd775c25acf4fe955fada31776fde010156787f651e602517c86f6a634c5764897d7a9b9976500e16528b7007101bf1f63fdff9221fb32e9e982d6d019beaf1eabefce8be03a4a1f9587e18d56d0b87a67b31b20ecff37a04d69569ee1eeec7a65afc8423459d560bb82e658c8b070f5342a2a77101ab038ba25731a70aeb9d382f20290cd696826cb74e91"),
    );
    isPlaying = true;
    currentDuration = await player.getDuration();
    notifyListeners();
  }

  saveMusic() {
    isSaved = !isSaved;
    notifyListeners();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }
}
