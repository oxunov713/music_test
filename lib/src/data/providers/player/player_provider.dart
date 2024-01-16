import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class PlayerViewModel extends ChangeNotifier {
  bool isPlaying = false;
  bool isSaved = false;
  bool loadIndicator = false;
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
    try {
      url =
          "https://storage.googleapis.com/musicapp-api/Songs/Nahide_Babashl%C4%B1_-_Bu_Ak%C5%9Fam_%C3%96l%C3%BCr%C3%BCm__256kbps_cbr_.mp3?X-Goog-Algorithm=GOOG4-RSA-SHA256&X-Goog-Credential=music-api%40protean-willow-407916.iam.gserviceaccount.com%2F20240116%2Fauto%2Fstorage%2Fgoog4_request&X-Goog-Date=20240116T082648Z&X-Goog-Expires=86400&X-Goog-SignedHeaders=host&X-Goog-Signature=7f78210cf1d00b7b46e7501a68108a53a026d415ab7ed2194cbb0283ad97c81860d1c9c70d35ca251df3ff18cf5dfc03a7d24a76d0de1c0f67a55d0c23a78c514b20a75a769b6e10e17a1432adad09ebc8896609d0aa8a65c36c821b6899d28efcc66b09140a572aeb2ebd1c7257b495dd32489e8639ba7424ff1527a21d8cc3a99f1b0c856235f80dc64bae12859a25dd6c4f92268795856d5a3187dc34e6ad6a2448ba6c7c98f204c2374748be39f4f37ed3bca0ad52c3395cfadd6ea1ed1fbc93c26097a97b73b91659466c22a777edf829c91ab63d9fa73bbb356b4a8bfa14dad96865c3c8287f67a69bf60cea8e671c2f3829466dc2207a71d83e20f783";
      await player.stop();
      loadIndicator = true;
      await player.play(UrlSource(url));
      isPlaying = true;
      currentDuration = await player.getDuration();
      loadIndicator = false;
      notifyListeners();
    } catch (e) {
      print("Error playing music: $e");
      // Handle the error as needed, e.g., show a user-friendly message
    }
  }

  stopMusic() async {
    await player.stop();
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
