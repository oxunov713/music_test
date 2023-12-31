import 'package:flutter/material.dart';

import '../../common/styles/app_colors.dart';

class HomeScreenViewModel extends ChangeNotifier {
  int currentMix = 0;

  String currentMixArtist = '';
  String currentSingerImage = '';
  String currentImage =
      "https://cdn.iticket.uz/event/poster_square/YkyOkiXJZWwX5ZpfW7abQgpCONrWlC1bTjpqWI5h.jpg";

  changeCurrent(String str) {
    currentImage = str;
    notifyListeners();
  }

  changecurrentSingerImage(String str) {
    currentSingerImage = str;
    notifyListeners();
  }

  final List<Color> colors = [
    AppColors.red,
    AppColors.green,
    AppColors.blue,
    AppColors.pink,
    AppColors.orange,
    AppColors.deepPurple,
  ];
  final List<String> artisMix = [
    "Billie,Zivert,Inna etc.",
    "Dua Lipa,Zivert,Inna etc.",
    "Nahide,Zivert,Inna etc.",
    "Hilola,Zivert,Inna etc.",
    "Zivert,Zivert,Inna etc.",
    "Selena,Zivert,Inna etc.",
    "Taylor Swift,Zivert,Inna etc.",
  ];
  final List<String> gridUrls = [
    "https://cdns-images.dzcdn.net/images/cover/fe7c10dfecd4ece5be97bc263cf0aea8/264x264.jpg",
    "https://s.france24.com/media/display/78bad01c-0766-11e9-bc4f-005056a964fe/w:1280/p:4x3/dua_lipa.jpg",
    "https://www.instyle.com/thmb/8udgopWlmIZyeO0fHI6XZljiAk4=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/taylor-swift-b6517c5c730d48a1a3d66d47d542236f.jpg",
    "https://mp3sepet.com/files/images/538/nahide-babasli-istanbul-uyurken.jpg",
    "https://i1.sndcdn.com/artworks-000471180375-2xomqi-t500x500.jpg",
    "https://cdns-images.dzcdn.net/images/cover/fe7c10dfecd4ece5be97bc263cf0aea8/264x264.jpg",
    "https://www.instyle.com/thmb/8udgopWlmIZyeO0fHI6XZljiAk4=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/taylor-swift-b6517c5c730d48a1a3d66d47d542236f.jpg",
    "https://cdns-images.dzcdn.net/images/cover/fe7c10dfecd4ece5be97bc263cf0aea8/264x264.jpg",
    "https://www.instyle.com/thmb/8udgopWlmIZyeO0fHI6XZljiAk4=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/taylor-swift-b6517c5c730d48a1a3d66d47d542236f.jpg",
    "https://cdns-images.dzcdn.net/images/cover/fe7c10dfecd4ece5be97bc263cf0aea8/264x264.jpg",
    "https://mp3sepet.com/files/images/538/nahide-babasli-istanbul-uyurken.jpg",
    "https://cdns-images.dzcdn.net/images/cover/fe7c10dfecd4ece5be97bc263cf0aea8/264x264.jpg",
    "https://s.france24.com/media/display/78bad01c-0766-11e9-bc4f-005056a964fe/w:1280/p:4x3/dua_lipa.jpg",
  ];
}
