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
    player.stop();
    await player.play(UrlSource(
        "https://storage.googleapis.com/musicapp-api/Songs/inbound6626980324943017443.mp3?X-Goog-Algorithm=GOOG4-RSA-SHA256&X-Goog-Credential=music-api%40protean-willow-407916.iam.gserviceaccount.com%2F20240103%2Fauto%2Fstorage%2Fgoog4_request&X-Goog-Date=20240103T053908Z&X-Goog-Expires=86400&X-Goog-SignedHeaders=host&X-Goog-Signature=8d9b23b3225dff6832ee8ab6a1af3fcc8e58fcfe7cca2cb0dd1314c27b25c13f02744375b37dd38d457ce2571c94a1196e6b7d1e15d3faa473a79f0869f943dd9b135a5a969f148722e8af20a721006ef79f923389b85368fdba03b6131ebc5c2047ac7918d22190e44458c285dc9c5dc2b0feb4bf52463c45cf296b687d2b2e03807006818970084e9744a3fb03c8514b0b8ec781fa5e645698292f7976e7dcf4b5f47318df34b500bd76e64568e309b76ccfd112fa686a2cec4e2dca9e3c6f9d5d8a80c56edc8f0f5513b9e427f102fd2b01ff71d3c6ab5ea06e6f044426ce248bee2457ab30ca0205ed9daa476ce9e0ed025179957019f505f1b29f05ea73"));
    print('Duration: ${await player.getDuration()}');
    print('Position: ${await player.getCurrentPosition()}');
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
