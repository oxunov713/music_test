import 'package:flutter/material.dart';

import 'model.dart';

class FakeData {
  List<Song> musicList = [
    Song(
      id: 0,
      specId: 0,
      name: "Bellayche",
      urlImage:
          "https://i1.sndcdn.com/artworks-000597792155-imw83t-t500x500.jpg",
      url:
      "https://storage.googleapis.com/musicapp-api/Songs/Nahide_Babashl%C4%B1_-_Bu_Ak%C5%9Fam_%C3%96l%C3%BCr%C3%BCm__256kbps_cbr_.mp3?X-Goog-Algorithm=GOOG4-RSA-SHA256&X-Goog-Credential=music-api%40protean-willow-407916.iam.gserviceaccount.com%2F20240111%2Fauto%2Fstorage%2Fgoog4_request&X-Goog-Date=20240111T114005Z&X-Goog-Expires=86400&X-Goog-SignedHeaders=host&X-Goog-Signature=3bd78e707cb23cd2232a6a70fe2d1f378d9f930cb77abfc2c92e6f3180d9ec444d613166e15e313b68350631b123a88b8c3603dcfe2c8405fe15b0c575b6b5619f586770d60bcc1e8818a931b844fc494b2a0536fbd33cf7008295527f4ce3cead97a5762ad1b61aa67f19a9478b83d597377f3a2b90fc64f4fb4b25c5cf14909b679aa5151ba2f28c351ea8c3d1bb0bae5065ee0342f947330d212753f86c9afa94c78c9344cc4b9093b47d30eda5de786a5b9efa3e0581d04b2d875a15396576dd2619957f3fd4b6b0948650669c96722ae8b4fe91c78dc61a4e4befb7d356200ed22edc4e5e453e60ef4baad6041046e6efe67a4fd650f82a389973752ef9",
    ),
    Song(
      id: 1,
      specId: 0,
      name: "No time to die",
      urlImage:
          "https://media.pitchfork.com/photos/5e470134ee3f2e0008bc86c5/16:9/w_1280,c_limit/BiillieEilish_NoTimetoDie_JamesBondtheme.jpg",
      url:
      "https://storage.googleapis.com/musicapp-api/Songs/Nahide_Babashl%C4%B1_-_Bu_Ak%C5%9Fam_%C3%96l%C3%BCr%C3%BCm__256kbps_cbr_.mp3?X-Goog-Algorithm=GOOG4-RSA-SHA256&X-Goog-Credential=music-api%40protean-willow-407916.iam.gserviceaccount.com%2F20240111%2Fauto%2Fstorage%2Fgoog4_request&X-Goog-Date=20240111T114005Z&X-Goog-Expires=86400&X-Goog-SignedHeaders=host&X-Goog-Signature=3bd78e707cb23cd2232a6a70fe2d1f378d9f930cb77abfc2c92e6f3180d9ec444d613166e15e313b68350631b123a88b8c3603dcfe2c8405fe15b0c575b6b5619f586770d60bcc1e8818a931b844fc494b2a0536fbd33cf7008295527f4ce3cead97a5762ad1b61aa67f19a9478b83d597377f3a2b90fc64f4fb4b25c5cf14909b679aa5151ba2f28c351ea8c3d1bb0bae5065ee0342f947330d212753f86c9afa94c78c9344cc4b9093b47d30eda5de786a5b9efa3e0581d04b2d875a15396576dd2619957f3fd4b6b0948650669c96722ae8b4fe91c78dc61a4e4befb7d356200ed22edc4e5e453e60ef4baad6041046e6efe67a4fd650f82a389973752ef9",
    ),
    Song(
      id: 2,
      specId: 0,
      name: "Lovely",
      urlImage:
          "https://i1.sndcdn.com/artworks-000549190149-b6cxwt-t500x500.jpg",
      url:
      "https://storage.googleapis.com/musicapp-api/Songs/Nahide_Babashl%C4%B1_-_Bu_Ak%C5%9Fam_%C3%96l%C3%BCr%C3%BCm__256kbps_cbr_.mp3?X-Goog-Algorithm=GOOG4-RSA-SHA256&X-Goog-Credential=music-api%40protean-willow-407916.iam.gserviceaccount.com%2F20240111%2Fauto%2Fstorage%2Fgoog4_request&X-Goog-Date=20240111T114005Z&X-Goog-Expires=86400&X-Goog-SignedHeaders=host&X-Goog-Signature=3bd78e707cb23cd2232a6a70fe2d1f378d9f930cb77abfc2c92e6f3180d9ec444d613166e15e313b68350631b123a88b8c3603dcfe2c8405fe15b0c575b6b5619f586770d60bcc1e8818a931b844fc494b2a0536fbd33cf7008295527f4ce3cead97a5762ad1b61aa67f19a9478b83d597377f3a2b90fc64f4fb4b25c5cf14909b679aa5151ba2f28c351ea8c3d1bb0bae5065ee0342f947330d212753f86c9afa94c78c9344cc4b9093b47d30eda5de786a5b9efa3e0581d04b2d875a15396576dd2619957f3fd4b6b0948650669c96722ae8b4fe91c78dc61a4e4befb7d356200ed22edc4e5e453e60ef4baad6041046e6efe67a4fd650f82a389973752ef9",
    ),
    Song(
      id: 3,
      specId: 1,
      name: "One Kiss",
      urlImage: "https://i.ytimg.com/vi/UEYJdlGrOCc/maxresdefault.jpg",
      url:
      "https://storage.googleapis.com/musicapp-api/Songs/Nahide_Babashl%C4%B1_-_Bu_Ak%C5%9Fam_%C3%96l%C3%BCr%C3%BCm__256kbps_cbr_.mp3?X-Goog-Algorithm=GOOG4-RSA-SHA256&X-Goog-Credential=music-api%40protean-willow-407916.iam.gserviceaccount.com%2F20240111%2Fauto%2Fstorage%2Fgoog4_request&X-Goog-Date=20240111T114005Z&X-Goog-Expires=86400&X-Goog-SignedHeaders=host&X-Goog-Signature=3bd78e707cb23cd2232a6a70fe2d1f378d9f930cb77abfc2c92e6f3180d9ec444d613166e15e313b68350631b123a88b8c3603dcfe2c8405fe15b0c575b6b5619f586770d60bcc1e8818a931b844fc494b2a0536fbd33cf7008295527f4ce3cead97a5762ad1b61aa67f19a9478b83d597377f3a2b90fc64f4fb4b25c5cf14909b679aa5151ba2f28c351ea8c3d1bb0bae5065ee0342f947330d212753f86c9afa94c78c9344cc4b9093b47d30eda5de786a5b9efa3e0581d04b2d875a15396576dd2619957f3fd4b6b0948650669c96722ae8b4fe91c78dc61a4e4befb7d356200ed22edc4e5e453e60ef4baad6041046e6efe67a4fd650f82a389973752ef9",
    ),
    Song(
      id: 4,
      specId: 1,
      name: "Cold Heart",
      urlImage:
          "https://i1.sndcdn.com/artworks-jzKUmTDpIyyRQC4R-jSoyBw-t500x500.jpg",
      url:
      "https://storage.googleapis.com/musicapp-api/Songs/Nahide_Babashl%C4%B1_-_Bu_Ak%C5%9Fam_%C3%96l%C3%BCr%C3%BCm__256kbps_cbr_.mp3?X-Goog-Algorithm=GOOG4-RSA-SHA256&X-Goog-Credential=music-api%40protean-willow-407916.iam.gserviceaccount.com%2F20240111%2Fauto%2Fstorage%2Fgoog4_request&X-Goog-Date=20240111T114005Z&X-Goog-Expires=86400&X-Goog-SignedHeaders=host&X-Goog-Signature=3bd78e707cb23cd2232a6a70fe2d1f378d9f930cb77abfc2c92e6f3180d9ec444d613166e15e313b68350631b123a88b8c3603dcfe2c8405fe15b0c575b6b5619f586770d60bcc1e8818a931b844fc494b2a0536fbd33cf7008295527f4ce3cead97a5762ad1b61aa67f19a9478b83d597377f3a2b90fc64f4fb4b25c5cf14909b679aa5151ba2f28c351ea8c3d1bb0bae5065ee0342f947330d212753f86c9afa94c78c9344cc4b9093b47d30eda5de786a5b9efa3e0581d04b2d875a15396576dd2619957f3fd4b6b0948650669c96722ae8b4fe91c78dc61a4e4befb7d356200ed22edc4e5e453e60ef4baad6041046e6efe67a4fd650f82a389973752ef9",
    ),
    Song(
      id: 5,
      specId: 1,
      name: "Levitation",
      urlImage:
          "https://i1.sndcdn.com/artworks-YL3ua1FAzIzzSk0e-OWj0qw-t500x500.jpg",
      url:
      "https://storage.googleapis.com/musicapp-api/Songs/Nahide_Babashl%C4%B1_-_Bu_Ak%C5%9Fam_%C3%96l%C3%BCr%C3%BCm__256kbps_cbr_.mp3?X-Goog-Algorithm=GOOG4-RSA-SHA256&X-Goog-Credential=music-api%40protean-willow-407916.iam.gserviceaccount.com%2F20240111%2Fauto%2Fstorage%2Fgoog4_request&X-Goog-Date=20240111T114005Z&X-Goog-Expires=86400&X-Goog-SignedHeaders=host&X-Goog-Signature=3bd78e707cb23cd2232a6a70fe2d1f378d9f930cb77abfc2c92e6f3180d9ec444d613166e15e313b68350631b123a88b8c3603dcfe2c8405fe15b0c575b6b5619f586770d60bcc1e8818a931b844fc494b2a0536fbd33cf7008295527f4ce3cead97a5762ad1b61aa67f19a9478b83d597377f3a2b90fc64f4fb4b25c5cf14909b679aa5151ba2f28c351ea8c3d1bb0bae5065ee0342f947330d212753f86c9afa94c78c9344cc4b9093b47d30eda5de786a5b9efa3e0581d04b2d875a15396576dd2619957f3fd4b6b0948650669c96722ae8b4fe91c78dc61a4e4befb7d356200ed22edc4e5e453e60ef4baad6041046e6efe67a4fd650f82a389973752ef9",
    ),
    Song(
      id: 6,
      specId: 2,
      name: "Tiryakinim",
      urlImage:
          "https://kmuzon.com/uploads/posts/2020-04/medium/nahide-babal-tiryakinim-remix.jpg",
      url:
      "https://storage.googleapis.com/musicapp-api/Songs/Nahide_Babashl%C4%B1_-_Bu_Ak%C5%9Fam_%C3%96l%C3%BCr%C3%BCm__256kbps_cbr_.mp3?X-Goog-Algorithm=GOOG4-RSA-SHA256&X-Goog-Credential=music-api%40protean-willow-407916.iam.gserviceaccount.com%2F20240111%2Fauto%2Fstorage%2Fgoog4_request&X-Goog-Date=20240111T114005Z&X-Goog-Expires=86400&X-Goog-SignedHeaders=host&X-Goog-Signature=3bd78e707cb23cd2232a6a70fe2d1f378d9f930cb77abfc2c92e6f3180d9ec444d613166e15e313b68350631b123a88b8c3603dcfe2c8405fe15b0c575b6b5619f586770d60bcc1e8818a931b844fc494b2a0536fbd33cf7008295527f4ce3cead97a5762ad1b61aa67f19a9478b83d597377f3a2b90fc64f4fb4b25c5cf14909b679aa5151ba2f28c351ea8c3d1bb0bae5065ee0342f947330d212753f86c9afa94c78c9344cc4b9093b47d30eda5de786a5b9efa3e0581d04b2d875a15396576dd2619957f3fd4b6b0948650669c96722ae8b4fe91c78dc61a4e4befb7d356200ed22edc4e5e453e60ef4baad6041046e6efe67a4fd650f82a389973752ef9",
    ),
    Song(
      id: 7,
      specId: 2,
      name: "Bu aksam olurum",
      urlImage:
          "https://i.scdn.co/image/ab67616d0000b2735512ee38580773cb52330660",
      url:
      "https://storage.googleapis.com/musicapp-api/Songs/Nahide_Babashl%C4%B1_-_Bu_Ak%C5%9Fam_%C3%96l%C3%BCr%C3%BCm__256kbps_cbr_.mp3?X-Goog-Algorithm=GOOG4-RSA-SHA256&X-Goog-Credential=music-api%40protean-willow-407916.iam.gserviceaccount.com%2F20240111%2Fauto%2Fstorage%2Fgoog4_request&X-Goog-Date=20240111T114005Z&X-Goog-Expires=86400&X-Goog-SignedHeaders=host&X-Goog-Signature=3bd78e707cb23cd2232a6a70fe2d1f378d9f930cb77abfc2c92e6f3180d9ec444d613166e15e313b68350631b123a88b8c3603dcfe2c8405fe15b0c575b6b5619f586770d60bcc1e8818a931b844fc494b2a0536fbd33cf7008295527f4ce3cead97a5762ad1b61aa67f19a9478b83d597377f3a2b90fc64f4fb4b25c5cf14909b679aa5151ba2f28c351ea8c3d1bb0bae5065ee0342f947330d212753f86c9afa94c78c9344cc4b9093b47d30eda5de786a5b9efa3e0581d04b2d875a15396576dd2619957f3fd4b6b0948650669c96722ae8b4fe91c78dc61a4e4befb7d356200ed22edc4e5e453e60ef4baad6041046e6efe67a4fd650f82a389973752ef9",
    ),
    Song(
      id: 8,
      specId: 2,
      name: "Ay Yuzlum",
      urlImage:
          "https://i1.sndcdn.com/artworks-TepVl9x28O3C2Rlo-xl9L4w-t500x500.jpg",
      url:
      "https://storage.googleapis.com/musicapp-api/Songs/Nahide_Babashl%C4%B1_-_Bu_Ak%C5%9Fam_%C3%96l%C3%BCr%C3%BCm__256kbps_cbr_.mp3?X-Goog-Algorithm=GOOG4-RSA-SHA256&X-Goog-Credential=music-api%40protean-willow-407916.iam.gserviceaccount.com%2F20240111%2Fauto%2Fstorage%2Fgoog4_request&X-Goog-Date=20240111T114005Z&X-Goog-Expires=86400&X-Goog-SignedHeaders=host&X-Goog-Signature=3bd78e707cb23cd2232a6a70fe2d1f378d9f930cb77abfc2c92e6f3180d9ec444d613166e15e313b68350631b123a88b8c3603dcfe2c8405fe15b0c575b6b5619f586770d60bcc1e8818a931b844fc494b2a0536fbd33cf7008295527f4ce3cead97a5762ad1b61aa67f19a9478b83d597377f3a2b90fc64f4fb4b25c5cf14909b679aa5151ba2f28c351ea8c3d1bb0bae5065ee0342f947330d212753f86c9afa94c78c9344cc4b9093b47d30eda5de786a5b9efa3e0581d04b2d875a15396576dd2619957f3fd4b6b0948650669c96722ae8b4fe91c78dc61a4e4befb7d356200ed22edc4e5e453e60ef4baad6041046e6efe67a4fd650f82a389973752ef9",
    ),
    Song(
      id: 15,
      specId: 3,
      name: "Calm Down",
      urlImage:
          "https://www.billboard.com/wp-content/uploads/2022/09/Rema-Selena-Gomez-Calm-Down-2022-billboard-1548.jpg",
      url:
      "https://storage.googleapis.com/musicapp-api/Songs/Nahide_Babashl%C4%B1_-_Bu_Ak%C5%9Fam_%C3%96l%C3%BCr%C3%BCm__256kbps_cbr_.mp3?X-Goog-Algorithm=GOOG4-RSA-SHA256&X-Goog-Credential=music-api%40protean-willow-407916.iam.gserviceaccount.com%2F20240111%2Fauto%2Fstorage%2Fgoog4_request&X-Goog-Date=20240111T114005Z&X-Goog-Expires=86400&X-Goog-SignedHeaders=host&X-Goog-Signature=3bd78e707cb23cd2232a6a70fe2d1f378d9f930cb77abfc2c92e6f3180d9ec444d613166e15e313b68350631b123a88b8c3603dcfe2c8405fe15b0c575b6b5619f586770d60bcc1e8818a931b844fc494b2a0536fbd33cf7008295527f4ce3cead97a5762ad1b61aa67f19a9478b83d597377f3a2b90fc64f4fb4b25c5cf14909b679aa5151ba2f28c351ea8c3d1bb0bae5065ee0342f947330d212753f86c9afa94c78c9344cc4b9093b47d30eda5de786a5b9efa3e0581d04b2d875a15396576dd2619957f3fd4b6b0948650669c96722ae8b4fe91c78dc61a4e4befb7d356200ed22edc4e5e453e60ef4baad6041046e6efe67a4fd650f82a389973752ef9",
    ),
    Song(
      id: 16,
      specId: 3,
      name: "My Mind",
      urlImage:
          "https://m.media-amazon.com/images/M/MV5BM2ZiYTU5YzYtMTE3NS00NTIyLTg2YTMtNWE2ODI2ZThhY2VmXkEyXkFqcGdeQXVyMTU3NTY0ODI3._V1_.jpg",
      url:
      "https://storage.googleapis.com/musicapp-api/Songs/Nahide_Babashl%C4%B1_-_Bu_Ak%C5%9Fam_%C3%96l%C3%BCr%C3%BCm__256kbps_cbr_.mp3?X-Goog-Algorithm=GOOG4-RSA-SHA256&X-Goog-Credential=music-api%40protean-willow-407916.iam.gserviceaccount.com%2F20240111%2Fauto%2Fstorage%2Fgoog4_request&X-Goog-Date=20240111T114005Z&X-Goog-Expires=86400&X-Goog-SignedHeaders=host&X-Goog-Signature=3bd78e707cb23cd2232a6a70fe2d1f378d9f930cb77abfc2c92e6f3180d9ec444d613166e15e313b68350631b123a88b8c3603dcfe2c8405fe15b0c575b6b5619f586770d60bcc1e8818a931b844fc494b2a0536fbd33cf7008295527f4ce3cead97a5762ad1b61aa67f19a9478b83d597377f3a2b90fc64f4fb4b25c5cf14909b679aa5151ba2f28c351ea8c3d1bb0bae5065ee0342f947330d212753f86c9afa94c78c9344cc4b9093b47d30eda5de786a5b9efa3e0581d04b2d875a15396576dd2619957f3fd4b6b0948650669c96722ae8b4fe91c78dc61a4e4befb7d356200ed22edc4e5e453e60ef4baad6041046e6efe67a4fd650f82a389973752ef9",
    ),
    Song(
      id: 17,
      specId: 3,
      name: "Good For you",
      urlImage:
          "https://pics.filmaffinity.com/Selena_Gomez_Good_for_You_Music_Video-870861465-large.jpg",
      url:
      "https://storage.googleapis.com/musicapp-api/Songs/Nahide_Babashl%C4%B1_-_Bu_Ak%C5%9Fam_%C3%96l%C3%BCr%C3%BCm__256kbps_cbr_.mp3?X-Goog-Algorithm=GOOG4-RSA-SHA256&X-Goog-Credential=music-api%40protean-willow-407916.iam.gserviceaccount.com%2F20240111%2Fauto%2Fstorage%2Fgoog4_request&X-Goog-Date=20240111T114005Z&X-Goog-Expires=86400&X-Goog-SignedHeaders=host&X-Goog-Signature=3bd78e707cb23cd2232a6a70fe2d1f378d9f930cb77abfc2c92e6f3180d9ec444d613166e15e313b68350631b123a88b8c3603dcfe2c8405fe15b0c575b6b5619f586770d60bcc1e8818a931b844fc494b2a0536fbd33cf7008295527f4ce3cead97a5762ad1b61aa67f19a9478b83d597377f3a2b90fc64f4fb4b25c5cf14909b679aa5151ba2f28c351ea8c3d1bb0bae5065ee0342f947330d212753f86c9afa94c78c9344cc4b9093b47d30eda5de786a5b9efa3e0581d04b2d875a15396576dd2619957f3fd4b6b0948650669c96722ae8b4fe91c78dc61a4e4befb7d356200ed22edc4e5e453e60ef4baad6041046e6efe67a4fd650f82a389973752ef9",
    ),
    Song(
      id: 18,
      specId: 4,
      name: "Cruel Summer",
      urlImage:
          "https://i1.sndcdn.com/artworks-DMYxxrwpIfjmv1yU-eOG0iQ-t500x500.jpg",
      url:
      "https://storage.googleapis.com/musicapp-api/Songs/Nahide_Babashl%C4%B1_-_Bu_Ak%C5%9Fam_%C3%96l%C3%BCr%C3%BCm__256kbps_cbr_.mp3?X-Goog-Algorithm=GOOG4-RSA-SHA256&X-Goog-Credential=music-api%40protean-willow-407916.iam.gserviceaccount.com%2F20240111%2Fauto%2Fstorage%2Fgoog4_request&X-Goog-Date=20240111T114005Z&X-Goog-Expires=86400&X-Goog-SignedHeaders=host&X-Goog-Signature=3bd78e707cb23cd2232a6a70fe2d1f378d9f930cb77abfc2c92e6f3180d9ec444d613166e15e313b68350631b123a88b8c3603dcfe2c8405fe15b0c575b6b5619f586770d60bcc1e8818a931b844fc494b2a0536fbd33cf7008295527f4ce3cead97a5762ad1b61aa67f19a9478b83d597377f3a2b90fc64f4fb4b25c5cf14909b679aa5151ba2f28c351ea8c3d1bb0bae5065ee0342f947330d212753f86c9afa94c78c9344cc4b9093b47d30eda5de786a5b9efa3e0581d04b2d875a15396576dd2619957f3fd4b6b0948650669c96722ae8b4fe91c78dc61a4e4befb7d356200ed22edc4e5e453e60ef4baad6041046e6efe67a4fd650f82a389973752ef9",
    ),
    Song(
      id: 19,
      specId: 4,
      name: "Blank Space",
      urlImage:
          "https://www.billboard.com/wp-content/uploads/2022/07/taylor-swift-blank-space-mv-still-2014-billboard-1548.jpg",
      url:
      "https://storage.googleapis.com/musicapp-api/Songs/Nahide_Babashl%C4%B1_-_Bu_Ak%C5%9Fam_%C3%96l%C3%BCr%C3%BCm__256kbps_cbr_.mp3?X-Goog-Algorithm=GOOG4-RSA-SHA256&X-Goog-Credential=music-api%40protean-willow-407916.iam.gserviceaccount.com%2F20240111%2Fauto%2Fstorage%2Fgoog4_request&X-Goog-Date=20240111T114005Z&X-Goog-Expires=86400&X-Goog-SignedHeaders=host&X-Goog-Signature=3bd78e707cb23cd2232a6a70fe2d1f378d9f930cb77abfc2c92e6f3180d9ec444d613166e15e313b68350631b123a88b8c3603dcfe2c8405fe15b0c575b6b5619f586770d60bcc1e8818a931b844fc494b2a0536fbd33cf7008295527f4ce3cead97a5762ad1b61aa67f19a9478b83d597377f3a2b90fc64f4fb4b25c5cf14909b679aa5151ba2f28c351ea8c3d1bb0bae5065ee0342f947330d212753f86c9afa94c78c9344cc4b9093b47d30eda5de786a5b9efa3e0581d04b2d875a15396576dd2619957f3fd4b6b0948650669c96722ae8b4fe91c78dc61a4e4befb7d356200ed22edc4e5e453e60ef4baad6041046e6efe67a4fd650f82a389973752ef9",
    ),
    Song(
      id: 20,
      specId: 4,
      name: "Lover",
      urlImage:
          "https://i1.sndcdn.com/artworks-JO5JqKo7lnOoEwTz-CrIuaA-t500x500.jpg",
      url:
      "https://storage.googleapis.com/musicapp-api/Songs/Nahide_Babashl%C4%B1_-_Bu_Ak%C5%9Fam_%C3%96l%C3%BCr%C3%BCm__256kbps_cbr_.mp3?X-Goog-Algorithm=GOOG4-RSA-SHA256&X-Goog-Credential=music-api%40protean-willow-407916.iam.gserviceaccount.com%2F20240111%2Fauto%2Fstorage%2Fgoog4_request&X-Goog-Date=20240111T114005Z&X-Goog-Expires=86400&X-Goog-SignedHeaders=host&X-Goog-Signature=3bd78e707cb23cd2232a6a70fe2d1f378d9f930cb77abfc2c92e6f3180d9ec444d613166e15e313b68350631b123a88b8c3603dcfe2c8405fe15b0c575b6b5619f586770d60bcc1e8818a931b844fc494b2a0536fbd33cf7008295527f4ce3cead97a5762ad1b61aa67f19a9478b83d597377f3a2b90fc64f4fb4b25c5cf14909b679aa5151ba2f28c351ea8c3d1bb0bae5065ee0342f947330d212753f86c9afa94c78c9344cc4b9093b47d30eda5de786a5b9efa3e0581d04b2d875a15396576dd2619957f3fd4b6b0948650669c96722ae8b4fe91c78dc61a4e4befb7d356200ed22edc4e5e453e60ef4baad6041046e6efe67a4fd650f82a389973752ef9",
    ),
    Song(
      id: 21,
      specId: 5,
      name: "Yalla",
      urlImage:
          "https://i1.sndcdn.com/artworks-000236340913-i5t0hp-t500x500.jpg",
      url:
      "https://storage.googleapis.com/musicapp-api/Songs/Nahide_Babashl%C4%B1_-_Bu_Ak%C5%9Fam_%C3%96l%C3%BCr%C3%BCm__256kbps_cbr_.mp3?X-Goog-Algorithm=GOOG4-RSA-SHA256&X-Goog-Credential=music-api%40protean-willow-407916.iam.gserviceaccount.com%2F20240111%2Fauto%2Fstorage%2Fgoog4_request&X-Goog-Date=20240111T114005Z&X-Goog-Expires=86400&X-Goog-SignedHeaders=host&X-Goog-Signature=3bd78e707cb23cd2232a6a70fe2d1f378d9f930cb77abfc2c92e6f3180d9ec444d613166e15e313b68350631b123a88b8c3603dcfe2c8405fe15b0c575b6b5619f586770d60bcc1e8818a931b844fc494b2a0536fbd33cf7008295527f4ce3cead97a5762ad1b61aa67f19a9478b83d597377f3a2b90fc64f4fb4b25c5cf14909b679aa5151ba2f28c351ea8c3d1bb0bae5065ee0342f947330d212753f86c9afa94c78c9344cc4b9093b47d30eda5de786a5b9efa3e0581d04b2d875a15396576dd2619957f3fd4b6b0948650669c96722ae8b4fe91c78dc61a4e4befb7d356200ed22edc4e5e453e60ef4baad6041046e6efe67a4fd650f82a389973752ef9",
    ),
    Song(
      id: 22,
      specId: 5,
      name: "Up",
      urlImage:
          "https://is1-ssl.mzstatic.com/image/thumb/Music114/v4/4e/3e/24/4e3e2467-3520-6ccd-79ab-d11b6f1db39a/195081937519.jpg/1200x1200bb.jpg",
      url:
      "https://storage.googleapis.com/musicapp-api/Songs/Nahide_Babashl%C4%B1_-_Bu_Ak%C5%9Fam_%C3%96l%C3%BCr%C3%BCm__256kbps_cbr_.mp3?X-Goog-Algorithm=GOOG4-RSA-SHA256&X-Goog-Credential=music-api%40protean-willow-407916.iam.gserviceaccount.com%2F20240111%2Fauto%2Fstorage%2Fgoog4_request&X-Goog-Date=20240111T114005Z&X-Goog-Expires=86400&X-Goog-SignedHeaders=host&X-Goog-Signature=3bd78e707cb23cd2232a6a70fe2d1f378d9f930cb77abfc2c92e6f3180d9ec444d613166e15e313b68350631b123a88b8c3603dcfe2c8405fe15b0c575b6b5619f586770d60bcc1e8818a931b844fc494b2a0536fbd33cf7008295527f4ce3cead97a5762ad1b61aa67f19a9478b83d597377f3a2b90fc64f4fb4b25c5cf14909b679aa5151ba2f28c351ea8c3d1bb0bae5065ee0342f947330d212753f86c9afa94c78c9344cc4b9093b47d30eda5de786a5b9efa3e0581d04b2d875a15396576dd2619957f3fd4b6b0948650669c96722ae8b4fe91c78dc61a4e4befb7d356200ed22edc4e5e453e60ef4baad6041046e6efe67a4fd650f82a389973752ef9",
    ),
    Song(
      id: 23,
      specId: 5,
      name: "Flashbacks",
      urlImage:
          "https://i1.sndcdn.com/artworks-WbGyFZVyRIGsGSby-YAwN9g-t500x500.jpg",
      url:
      "https://storage.googleapis.com/musicapp-api/Songs/Nahide_Babashl%C4%B1_-_Bu_Ak%C5%9Fam_%C3%96l%C3%BCr%C3%BCm__256kbps_cbr_.mp3?X-Goog-Algorithm=GOOG4-RSA-SHA256&X-Goog-Credential=music-api%40protean-willow-407916.iam.gserviceaccount.com%2F20240111%2Fauto%2Fstorage%2Fgoog4_request&X-Goog-Date=20240111T114005Z&X-Goog-Expires=86400&X-Goog-SignedHeaders=host&X-Goog-Signature=3bd78e707cb23cd2232a6a70fe2d1f378d9f930cb77abfc2c92e6f3180d9ec444d613166e15e313b68350631b123a88b8c3603dcfe2c8405fe15b0c575b6b5619f586770d60bcc1e8818a931b844fc494b2a0536fbd33cf7008295527f4ce3cead97a5762ad1b61aa67f19a9478b83d597377f3a2b90fc64f4fb4b25c5cf14909b679aa5151ba2f28c351ea8c3d1bb0bae5065ee0342f947330d212753f86c9afa94c78c9344cc4b9093b47d30eda5de786a5b9efa3e0581d04b2d875a15396576dd2619957f3fd4b6b0948650669c96722ae8b4fe91c78dc61a4e4befb7d356200ed22edc4e5e453e60ef4baad6041046e6efe67a4fd650f82a389973752ef9",
    ),
    Song(
      id: 24,
      specId: 6,
      name: "Adashdimmi",
      urlImage: "https://i.ytimg.com/vi/3tYjYR93zU8/maxresdefault.jpg",
      url:
      "https://storage.googleapis.com/musicapp-api/Songs/Nahide_Babashl%C4%B1_-_Bu_Ak%C5%9Fam_%C3%96l%C3%BCr%C3%BCm__256kbps_cbr_.mp3?X-Goog-Algorithm=GOOG4-RSA-SHA256&X-Goog-Credential=music-api%40protean-willow-407916.iam.gserviceaccount.com%2F20240111%2Fauto%2Fstorage%2Fgoog4_request&X-Goog-Date=20240111T114005Z&X-Goog-Expires=86400&X-Goog-SignedHeaders=host&X-Goog-Signature=3bd78e707cb23cd2232a6a70fe2d1f378d9f930cb77abfc2c92e6f3180d9ec444d613166e15e313b68350631b123a88b8c3603dcfe2c8405fe15b0c575b6b5619f586770d60bcc1e8818a931b844fc494b2a0536fbd33cf7008295527f4ce3cead97a5762ad1b61aa67f19a9478b83d597377f3a2b90fc64f4fb4b25c5cf14909b679aa5151ba2f28c351ea8c3d1bb0bae5065ee0342f947330d212753f86c9afa94c78c9344cc4b9093b47d30eda5de786a5b9efa3e0581d04b2d875a15396576dd2619957f3fd4b6b0948650669c96722ae8b4fe91c78dc61a4e4befb7d356200ed22edc4e5e453e60ef4baad6041046e6efe67a4fd650f82a389973752ef9",
    ),
    Song(
      id: 25,
      specId: 6,
      name: "Balki tun",
      urlImage: "https://i.ytimg.com/vi/wEWAhZE3bNw/maxresdefault.jpg",
      url:
      "https://storage.googleapis.com/musicapp-api/Songs/Nahide_Babashl%C4%B1_-_Bu_Ak%C5%9Fam_%C3%96l%C3%BCr%C3%BCm__256kbps_cbr_.mp3?X-Goog-Algorithm=GOOG4-RSA-SHA256&X-Goog-Credential=music-api%40protean-willow-407916.iam.gserviceaccount.com%2F20240111%2Fauto%2Fstorage%2Fgoog4_request&X-Goog-Date=20240111T114005Z&X-Goog-Expires=86400&X-Goog-SignedHeaders=host&X-Goog-Signature=3bd78e707cb23cd2232a6a70fe2d1f378d9f930cb77abfc2c92e6f3180d9ec444d613166e15e313b68350631b123a88b8c3603dcfe2c8405fe15b0c575b6b5619f586770d60bcc1e8818a931b844fc494b2a0536fbd33cf7008295527f4ce3cead97a5762ad1b61aa67f19a9478b83d597377f3a2b90fc64f4fb4b25c5cf14909b679aa5151ba2f28c351ea8c3d1bb0bae5065ee0342f947330d212753f86c9afa94c78c9344cc4b9093b47d30eda5de786a5b9efa3e0581d04b2d875a15396576dd2619957f3fd4b6b0948650669c96722ae8b4fe91c78dc61a4e4befb7d356200ed22edc4e5e453e60ef4baad6041046e6efe67a4fd650f82a389973752ef9",
    ),
    Song(
      id: 26,
      specId: 6,
      name: "Yoningdaman",
      urlImage: "https://i.ytimg.com/vi/gwb-rLgxXAA/maxresdefault.jpg",
      url:
      "https://storage.googleapis.com/musicapp-api/Songs/Nahide_Babashl%C4%B1_-_Bu_Ak%C5%9Fam_%C3%96l%C3%BCr%C3%BCm__256kbps_cbr_.mp3?X-Goog-Algorithm=GOOG4-RSA-SHA256&X-Goog-Credential=music-api%40protean-willow-407916.iam.gserviceaccount.com%2F20240111%2Fauto%2Fstorage%2Fgoog4_request&X-Goog-Date=20240111T114005Z&X-Goog-Expires=86400&X-Goog-SignedHeaders=host&X-Goog-Signature=3bd78e707cb23cd2232a6a70fe2d1f378d9f930cb77abfc2c92e6f3180d9ec444d613166e15e313b68350631b123a88b8c3603dcfe2c8405fe15b0c575b6b5619f586770d60bcc1e8818a931b844fc494b2a0536fbd33cf7008295527f4ce3cead97a5762ad1b61aa67f19a9478b83d597377f3a2b90fc64f4fb4b25c5cf14909b679aa5151ba2f28c351ea8c3d1bb0bae5065ee0342f947330d212753f86c9afa94c78c9344cc4b9093b47d30eda5de786a5b9efa3e0581d04b2d875a15396576dd2619957f3fd4b6b0948650669c96722ae8b4fe91c78dc61a4e4befb7d356200ed22edc4e5e453e60ef4baad6041046e6efe67a4fd650f82a389973752ef9",
    ),
    Song(
      id: 27,
      specId: 7,
      name: "Bevafo dil",
      urlImage:
          "https://is1-ssl.mzstatic.com/image/thumb/Music126/v4/32/75/50/327550ba-277d-64db-83d0-2b0d57b4ec8f/8721056403905.png/1200x630bb.jpg",
      url:
      "https://storage.googleapis.com/musicapp-api/Songs/Nahide_Babashl%C4%B1_-_Bu_Ak%C5%9Fam_%C3%96l%C3%BCr%C3%BCm__256kbps_cbr_.mp3?X-Goog-Algorithm=GOOG4-RSA-SHA256&X-Goog-Credential=music-api%40protean-willow-407916.iam.gserviceaccount.com%2F20240111%2Fauto%2Fstorage%2Fgoog4_request&X-Goog-Date=20240111T114005Z&X-Goog-Expires=86400&X-Goog-SignedHeaders=host&X-Goog-Signature=3bd78e707cb23cd2232a6a70fe2d1f378d9f930cb77abfc2c92e6f3180d9ec444d613166e15e313b68350631b123a88b8c3603dcfe2c8405fe15b0c575b6b5619f586770d60bcc1e8818a931b844fc494b2a0536fbd33cf7008295527f4ce3cead97a5762ad1b61aa67f19a9478b83d597377f3a2b90fc64f4fb4b25c5cf14909b679aa5151ba2f28c351ea8c3d1bb0bae5065ee0342f947330d212753f86c9afa94c78c9344cc4b9093b47d30eda5de786a5b9efa3e0581d04b2d875a15396576dd2619957f3fd4b6b0948650669c96722ae8b4fe91c78dc61a4e4befb7d356200ed22edc4e5e453e60ef4baad6041046e6efe67a4fd650f82a389973752ef9",
    ),
    Song(
      id: 28,
      specId: 7,
      name: "Nigoro",
      urlImage:
          "https://is1-ssl.mzstatic.com/image/thumb/Music126/v4/32/75/50/327550ba-277d-64db-83d0-2b0d57b4ec8f/8721056403905.png/1200x630bb.jpg",
      url:
      "https://storage.googleapis.com/musicapp-api/Songs/Nahide_Babashl%C4%B1_-_Bu_Ak%C5%9Fam_%C3%96l%C3%BCr%C3%BCm__256kbps_cbr_.mp3?X-Goog-Algorithm=GOOG4-RSA-SHA256&X-Goog-Credential=music-api%40protean-willow-407916.iam.gserviceaccount.com%2F20240111%2Fauto%2Fstorage%2Fgoog4_request&X-Goog-Date=20240111T114005Z&X-Goog-Expires=86400&X-Goog-SignedHeaders=host&X-Goog-Signature=3bd78e707cb23cd2232a6a70fe2d1f378d9f930cb77abfc2c92e6f3180d9ec444d613166e15e313b68350631b123a88b8c3603dcfe2c8405fe15b0c575b6b5619f586770d60bcc1e8818a931b844fc494b2a0536fbd33cf7008295527f4ce3cead97a5762ad1b61aa67f19a9478b83d597377f3a2b90fc64f4fb4b25c5cf14909b679aa5151ba2f28c351ea8c3d1bb0bae5065ee0342f947330d212753f86c9afa94c78c9344cc4b9093b47d30eda5de786a5b9efa3e0581d04b2d875a15396576dd2619957f3fd4b6b0948650669c96722ae8b4fe91c78dc61a4e4befb7d356200ed22edc4e5e453e60ef4baad6041046e6efe67a4fd650f82a389973752ef9",
    ),
    Song(
      id: 29,
      specId: 7,
      name: "Sog'indim",
      urlImage:
          "https://is1-ssl.mzstatic.com/image/thumb/Music126/v4/75/b7/db/75b7dbca-f72a-d703-8229-cd0252c6a677/8720693724435.png/600x600bf-60.jpg",
      url:
      "https://storage.googleapis.com/musicapp-api/Songs/Nahide_Babashl%C4%B1_-_Bu_Ak%C5%9Fam_%C3%96l%C3%BCr%C3%BCm__256kbps_cbr_.mp3?X-Goog-Algorithm=GOOG4-RSA-SHA256&X-Goog-Credential=music-api%40protean-willow-407916.iam.gserviceaccount.com%2F20240111%2Fauto%2Fstorage%2Fgoog4_request&X-Goog-Date=20240111T114005Z&X-Goog-Expires=86400&X-Goog-SignedHeaders=host&X-Goog-Signature=3bd78e707cb23cd2232a6a70fe2d1f378d9f930cb77abfc2c92e6f3180d9ec444d613166e15e313b68350631b123a88b8c3603dcfe2c8405fe15b0c575b6b5619f586770d60bcc1e8818a931b844fc494b2a0536fbd33cf7008295527f4ce3cead97a5762ad1b61aa67f19a9478b83d597377f3a2b90fc64f4fb4b25c5cf14909b679aa5151ba2f28c351ea8c3d1bb0bae5065ee0342f947330d212753f86c9afa94c78c9344cc4b9093b47d30eda5de786a5b9efa3e0581d04b2d875a15396576dd2619957f3fd4b6b0948650669c96722ae8b4fe91c78dc61a4e4befb7d356200ed22edc4e5e453e60ef4baad6041046e6efe67a4fd650f82a389973752ef9",
    ),
    Song(
      id: 30,
      specId: 8,
      name: "Jim turing",
      urlImage: "https://i.ytimg.com/vi/mHm_qEcaQDU/maxresdefault.jpg",
      url:
          "https://storage.googleapis.com/musicapp-api/Songs/Nahide_Babashl%C4%B1_-_Bu_Ak%C5%9Fam_%C3%96l%C3%BCr%C3%BCm__256kbps_cbr_.mp3?X-Goog-Algorithm=GOOG4-RSA-SHA256&X-Goog-Credential=music-api%40protean-willow-407916.iam.gserviceaccount.com%2F20240111%2Fauto%2Fstorage%2Fgoog4_request&X-Goog-Date=20240111T114005Z&X-Goog-Expires=86400&X-Goog-SignedHeaders=host&X-Goog-Signature=3bd78e707cb23cd2232a6a70fe2d1f378d9f930cb77abfc2c92e6f3180d9ec444d613166e15e313b68350631b123a88b8c3603dcfe2c8405fe15b0c575b6b5619f586770d60bcc1e8818a931b844fc494b2a0536fbd33cf7008295527f4ce3cead97a5762ad1b61aa67f19a9478b83d597377f3a2b90fc64f4fb4b25c5cf14909b679aa5151ba2f28c351ea8c3d1bb0bae5065ee0342f947330d212753f86c9afa94c78c9344cc4b9093b47d30eda5de786a5b9efa3e0581d04b2d875a15396576dd2619957f3fd4b6b0948650669c96722ae8b4fe91c78dc61a4e4befb7d356200ed22edc4e5e453e60ef4baad6041046e6efe67a4fd650f82a389973752ef9",
    ),
    Song(
      id: 31,
      specId: 8,
      name: "Yo'q yo'q",
      urlImage:
          "https://is1-ssl.mzstatic.com/image/thumb/Music126/v4/bc/a3/3e/bca33e53-1613-c8a7-f4dd-e8a1e26dda7f/8720996958742.png/1200x630bb.jpg",
      url:
      "https://storage.googleapis.com/musicapp-api/Songs/Nahide_Babashl%C4%B1_-_Bu_Ak%C5%9Fam_%C3%96l%C3%BCr%C3%BCm__256kbps_cbr_.mp3?X-Goog-Algorithm=GOOG4-RSA-SHA256&X-Goog-Credential=music-api%40protean-willow-407916.iam.gserviceaccount.com%2F20240111%2Fauto%2Fstorage%2Fgoog4_request&X-Goog-Date=20240111T114005Z&X-Goog-Expires=86400&X-Goog-SignedHeaders=host&X-Goog-Signature=3bd78e707cb23cd2232a6a70fe2d1f378d9f930cb77abfc2c92e6f3180d9ec444d613166e15e313b68350631b123a88b8c3603dcfe2c8405fe15b0c575b6b5619f586770d60bcc1e8818a931b844fc494b2a0536fbd33cf7008295527f4ce3cead97a5762ad1b61aa67f19a9478b83d597377f3a2b90fc64f4fb4b25c5cf14909b679aa5151ba2f28c351ea8c3d1bb0bae5065ee0342f947330d212753f86c9afa94c78c9344cc4b9093b47d30eda5de786a5b9efa3e0581d04b2d875a15396576dd2619957f3fd4b6b0948650669c96722ae8b4fe91c78dc61a4e4befb7d356200ed22edc4e5e453e60ef4baad6041046e6efe67a4fd650f82a389973752ef9",
    ),
    Song(
      id: 32,
      specId: 8,
      name: "Aldamadim",
      urlImage:
          "https://is1-ssl.mzstatic.com/image/thumb/Music115/v4/82/1e/e9/821ee9b4-6494-88ef-ebb7-c76828ad9e4f/8720205897022.png/486x486bb.png",
      url:
      "https://storage.googleapis.com/musicapp-api/Songs/Nahide_Babashl%C4%B1_-_Bu_Ak%C5%9Fam_%C3%96l%C3%BCr%C3%BCm__256kbps_cbr_.mp3?X-Goog-Algorithm=GOOG4-RSA-SHA256&X-Goog-Credential=music-api%40protean-willow-407916.iam.gserviceaccount.com%2F20240111%2Fauto%2Fstorage%2Fgoog4_request&X-Goog-Date=20240111T114005Z&X-Goog-Expires=86400&X-Goog-SignedHeaders=host&X-Goog-Signature=3bd78e707cb23cd2232a6a70fe2d1f378d9f930cb77abfc2c92e6f3180d9ec444d613166e15e313b68350631b123a88b8c3603dcfe2c8405fe15b0c575b6b5619f586770d60bcc1e8818a931b844fc494b2a0536fbd33cf7008295527f4ce3cead97a5762ad1b61aa67f19a9478b83d597377f3a2b90fc64f4fb4b25c5cf14909b679aa5151ba2f28c351ea8c3d1bb0bae5065ee0342f947330d212753f86c9afa94c78c9344cc4b9093b47d30eda5de786a5b9efa3e0581d04b2d875a15396576dd2619957f3fd4b6b0948650669c96722ae8b4fe91c78dc61a4e4befb7d356200ed22edc4e5e453e60ef4baad6041046e6efe67a4fd650f82a389973752ef9",
    ),
    Song(
      id: 33,
      specId: 9,
      name: "Pariro'y",
      urlImage:
          "https://kmuzon.com/uploads/posts/2018-12/medium/ozodbek-nazarbekov-pariroy.jpg",
      url:
      "https://storage.googleapis.com/musicapp-api/Songs/Nahide_Babashl%C4%B1_-_Bu_Ak%C5%9Fam_%C3%96l%C3%BCr%C3%BCm__256kbps_cbr_.mp3?X-Goog-Algorithm=GOOG4-RSA-SHA256&X-Goog-Credential=music-api%40protean-willow-407916.iam.gserviceaccount.com%2F20240111%2Fauto%2Fstorage%2Fgoog4_request&X-Goog-Date=20240111T114005Z&X-Goog-Expires=86400&X-Goog-SignedHeaders=host&X-Goog-Signature=3bd78e707cb23cd2232a6a70fe2d1f378d9f930cb77abfc2c92e6f3180d9ec444d613166e15e313b68350631b123a88b8c3603dcfe2c8405fe15b0c575b6b5619f586770d60bcc1e8818a931b844fc494b2a0536fbd33cf7008295527f4ce3cead97a5762ad1b61aa67f19a9478b83d597377f3a2b90fc64f4fb4b25c5cf14909b679aa5151ba2f28c351ea8c3d1bb0bae5065ee0342f947330d212753f86c9afa94c78c9344cc4b9093b47d30eda5de786a5b9efa3e0581d04b2d875a15396576dd2619957f3fd4b6b0948650669c96722ae8b4fe91c78dc61a4e4befb7d356200ed22edc4e5e453e60ef4baad6041046e6efe67a4fd650f82a389973752ef9",
    ),
    Song(
      id: 34,
      specId: 9,
      name: "Kelgin gulim",
      urlImage:
          "https://muzxax.net/uploads/cache/ozodbek-nazarbekov-kelgin-gulim-ada36081.jpg",
      url:
      "https://storage.googleapis.com/musicapp-api/Songs/Nahide_Babashl%C4%B1_-_Bu_Ak%C5%9Fam_%C3%96l%C3%BCr%C3%BCm__256kbps_cbr_.mp3?X-Goog-Algorithm=GOOG4-RSA-SHA256&X-Goog-Credential=music-api%40protean-willow-407916.iam.gserviceaccount.com%2F20240111%2Fauto%2Fstorage%2Fgoog4_request&X-Goog-Date=20240111T114005Z&X-Goog-Expires=86400&X-Goog-SignedHeaders=host&X-Goog-Signature=3bd78e707cb23cd2232a6a70fe2d1f378d9f930cb77abfc2c92e6f3180d9ec444d613166e15e313b68350631b123a88b8c3603dcfe2c8405fe15b0c575b6b5619f586770d60bcc1e8818a931b844fc494b2a0536fbd33cf7008295527f4ce3cead97a5762ad1b61aa67f19a9478b83d597377f3a2b90fc64f4fb4b25c5cf14909b679aa5151ba2f28c351ea8c3d1bb0bae5065ee0342f947330d212753f86c9afa94c78c9344cc4b9093b47d30eda5de786a5b9efa3e0581d04b2d875a15396576dd2619957f3fd4b6b0948650669c96722ae8b4fe91c78dc61a4e4befb7d356200ed22edc4e5e453e60ef4baad6041046e6efe67a4fd650f82a389973752ef9",
    ),
    Song(
      id: 35,
      specId: 9,
      name: "Yig'larmisan",
      urlImage: "https://i.ytimg.com/vi/8rWoNoRPQHw/maxresdefault.jpg",
      url:
      "https://storage.googleapis.com/musicapp-api/Songs/Nahide_Babashl%C4%B1_-_Bu_Ak%C5%9Fam_%C3%96l%C3%BCr%C3%BCm__256kbps_cbr_.mp3?X-Goog-Algorithm=GOOG4-RSA-SHA256&X-Goog-Credential=music-api%40protean-willow-407916.iam.gserviceaccount.com%2F20240111%2Fauto%2Fstorage%2Fgoog4_request&X-Goog-Date=20240111T114005Z&X-Goog-Expires=86400&X-Goog-SignedHeaders=host&X-Goog-Signature=3bd78e707cb23cd2232a6a70fe2d1f378d9f930cb77abfc2c92e6f3180d9ec444d613166e15e313b68350631b123a88b8c3603dcfe2c8405fe15b0c575b6b5619f586770d60bcc1e8818a931b844fc494b2a0536fbd33cf7008295527f4ce3cead97a5762ad1b61aa67f19a9478b83d597377f3a2b90fc64f4fb4b25c5cf14909b679aa5151ba2f28c351ea8c3d1bb0bae5065ee0342f947330d212753f86c9afa94c78c9344cc4b9093b47d30eda5de786a5b9efa3e0581d04b2d875a15396576dd2619957f3fd4b6b0948650669c96722ae8b4fe91c78dc61a4e4befb7d356200ed22edc4e5e453e60ef4baad6041046e6efe67a4fd650f82a389973752ef9",
    ),
    Song(
      id: 36,
      specId: 10,
      name: "Felaket",
      urlImage:
          "https://is1-ssl.mzstatic.com/image/thumb/Music112/v4/78/c2/a6/78c2a626-93b7-bc8b-6e6f-33d31fbb2ca6/cover.jpg/1200x630wp-60.jpg",
      url:
      "https://storage.googleapis.com/musicapp-api/Songs/Nahide_Babashl%C4%B1_-_Bu_Ak%C5%9Fam_%C3%96l%C3%BCr%C3%BCm__256kbps_cbr_.mp3?X-Goog-Algorithm=GOOG4-RSA-SHA256&X-Goog-Credential=music-api%40protean-willow-407916.iam.gserviceaccount.com%2F20240111%2Fauto%2Fstorage%2Fgoog4_request&X-Goog-Date=20240111T114005Z&X-Goog-Expires=86400&X-Goog-SignedHeaders=host&X-Goog-Signature=3bd78e707cb23cd2232a6a70fe2d1f378d9f930cb77abfc2c92e6f3180d9ec444d613166e15e313b68350631b123a88b8c3603dcfe2c8405fe15b0c575b6b5619f586770d60bcc1e8818a931b844fc494b2a0536fbd33cf7008295527f4ce3cead97a5762ad1b61aa67f19a9478b83d597377f3a2b90fc64f4fb4b25c5cf14909b679aa5151ba2f28c351ea8c3d1bb0bae5065ee0342f947330d212753f86c9afa94c78c9344cc4b9093b47d30eda5de786a5b9efa3e0581d04b2d875a15396576dd2619957f3fd4b6b0948650669c96722ae8b4fe91c78dc61a4e4befb7d356200ed22edc4e5e453e60ef4baad6041046e6efe67a4fd650f82a389973752ef9",
    ),
    Song(
      id: 37,
      specId: 10,
      name: "Zebo",
      urlImage:
          "https://is1-ssl.mzstatic.com/image/thumb/Music123/v4/69/d9/86/69d9868b-f4d0-673a-c3fe-3c6b79d9be6d/cover.jpg/1200x1200bf-60.jpg",
      url:
      "https://storage.googleapis.com/musicapp-api/Songs/Nahide_Babashl%C4%B1_-_Bu_Ak%C5%9Fam_%C3%96l%C3%BCr%C3%BCm__256kbps_cbr_.mp3?X-Goog-Algorithm=GOOG4-RSA-SHA256&X-Goog-Credential=music-api%40protean-willow-407916.iam.gserviceaccount.com%2F20240111%2Fauto%2Fstorage%2Fgoog4_request&X-Goog-Date=20240111T114005Z&X-Goog-Expires=86400&X-Goog-SignedHeaders=host&X-Goog-Signature=3bd78e707cb23cd2232a6a70fe2d1f378d9f930cb77abfc2c92e6f3180d9ec444d613166e15e313b68350631b123a88b8c3603dcfe2c8405fe15b0c575b6b5619f586770d60bcc1e8818a931b844fc494b2a0536fbd33cf7008295527f4ce3cead97a5762ad1b61aa67f19a9478b83d597377f3a2b90fc64f4fb4b25c5cf14909b679aa5151ba2f28c351ea8c3d1bb0bae5065ee0342f947330d212753f86c9afa94c78c9344cc4b9093b47d30eda5de786a5b9efa3e0581d04b2d875a15396576dd2619957f3fd4b6b0948650669c96722ae8b4fe91c78dc61a4e4befb7d356200ed22edc4e5e453e60ef4baad6041046e6efe67a4fd650f82a389973752ef9",
    ),
    Song(
      id: 38,
      specId: 10,
      name: "Lilovaya",
      urlImage:
          "https://source.boomplaymusic.com/group10/M00/10/07/a2b6c53580e24855a62d114cb9373856.jpg",
      url:
      "https://storage.googleapis.com/musicapp-api/Songs/Nahide_Babashl%C4%B1_-_Bu_Ak%C5%9Fam_%C3%96l%C3%BCr%C3%BCm__256kbps_cbr_.mp3?X-Goog-Algorithm=GOOG4-RSA-SHA256&X-Goog-Credential=music-api%40protean-willow-407916.iam.gserviceaccount.com%2F20240111%2Fauto%2Fstorage%2Fgoog4_request&X-Goog-Date=20240111T114005Z&X-Goog-Expires=86400&X-Goog-SignedHeaders=host&X-Goog-Signature=3bd78e707cb23cd2232a6a70fe2d1f378d9f930cb77abfc2c92e6f3180d9ec444d613166e15e313b68350631b123a88b8c3603dcfe2c8405fe15b0c575b6b5619f586770d60bcc1e8818a931b844fc494b2a0536fbd33cf7008295527f4ce3cead97a5762ad1b61aa67f19a9478b83d597377f3a2b90fc64f4fb4b25c5cf14909b679aa5151ba2f28c351ea8c3d1bb0bae5065ee0342f947330d212753f86c9afa94c78c9344cc4b9093b47d30eda5de786a5b9efa3e0581d04b2d875a15396576dd2619957f3fd4b6b0948650669c96722ae8b4fe91c78dc61a4e4befb7d356200ed22edc4e5e453e60ef4baad6041046e6efe67a4fd650f82a389973752ef9",
    ),
    Song(
      id: 39,
      specId: 11,
      name: "Zoya",
      urlImage: "https://i.ytimg.com/vi/GgUFop151gA/maxresdefault.jpg",
      url:
      "https://storage.googleapis.com/musicapp-api/Songs/Nahide_Babashl%C4%B1_-_Bu_Ak%C5%9Fam_%C3%96l%C3%BCr%C3%BCm__256kbps_cbr_.mp3?X-Goog-Algorithm=GOOG4-RSA-SHA256&X-Goog-Credential=music-api%40protean-willow-407916.iam.gserviceaccount.com%2F20240111%2Fauto%2Fstorage%2Fgoog4_request&X-Goog-Date=20240111T114005Z&X-Goog-Expires=86400&X-Goog-SignedHeaders=host&X-Goog-Signature=3bd78e707cb23cd2232a6a70fe2d1f378d9f930cb77abfc2c92e6f3180d9ec444d613166e15e313b68350631b123a88b8c3603dcfe2c8405fe15b0c575b6b5619f586770d60bcc1e8818a931b844fc494b2a0536fbd33cf7008295527f4ce3cead97a5762ad1b61aa67f19a9478b83d597377f3a2b90fc64f4fb4b25c5cf14909b679aa5151ba2f28c351ea8c3d1bb0bae5065ee0342f947330d212753f86c9afa94c78c9344cc4b9093b47d30eda5de786a5b9efa3e0581d04b2d875a15396576dd2619957f3fd4b6b0948650669c96722ae8b4fe91c78dc61a4e4befb7d356200ed22edc4e5e453e60ef4baad6041046e6efe67a4fd650f82a389973752ef9",
    ),
    Song(
      id: 40,
      specId: 11,
      name: "O'ylamadim",
      urlImage: "https://i.ytimg.com/vi/FjiHPy6OZNk/maxresdefault.jpg",
      url:
      "https://storage.googleapis.com/musicapp-api/Songs/Nahide_Babashl%C4%B1_-_Bu_Ak%C5%9Fam_%C3%96l%C3%BCr%C3%BCm__256kbps_cbr_.mp3?X-Goog-Algorithm=GOOG4-RSA-SHA256&X-Goog-Credential=music-api%40protean-willow-407916.iam.gserviceaccount.com%2F20240111%2Fauto%2Fstorage%2Fgoog4_request&X-Goog-Date=20240111T114005Z&X-Goog-Expires=86400&X-Goog-SignedHeaders=host&X-Goog-Signature=3bd78e707cb23cd2232a6a70fe2d1f378d9f930cb77abfc2c92e6f3180d9ec444d613166e15e313b68350631b123a88b8c3603dcfe2c8405fe15b0c575b6b5619f586770d60bcc1e8818a931b844fc494b2a0536fbd33cf7008295527f4ce3cead97a5762ad1b61aa67f19a9478b83d597377f3a2b90fc64f4fb4b25c5cf14909b679aa5151ba2f28c351ea8c3d1bb0bae5065ee0342f947330d212753f86c9afa94c78c9344cc4b9093b47d30eda5de786a5b9efa3e0581d04b2d875a15396576dd2619957f3fd4b6b0948650669c96722ae8b4fe91c78dc61a4e4befb7d356200ed22edc4e5e453e60ef4baad6041046e6efe67a4fd650f82a389973752ef9",
    ),
    Song(
      id: 41,
      specId: 11,
      name: "Afsus",
      urlImage: "https://i.ytimg.com/vi/FjiHPy6OZNk/maxresdefault.jpg",
      url:
      "https://storage.googleapis.com/musicapp-api/Songs/Nahide_Babashl%C4%B1_-_Bu_Ak%C5%9Fam_%C3%96l%C3%BCr%C3%BCm__256kbps_cbr_.mp3?X-Goog-Algorithm=GOOG4-RSA-SHA256&X-Goog-Credential=music-api%40protean-willow-407916.iam.gserviceaccount.com%2F20240111%2Fauto%2Fstorage%2Fgoog4_request&X-Goog-Date=20240111T114005Z&X-Goog-Expires=86400&X-Goog-SignedHeaders=host&X-Goog-Signature=3bd78e707cb23cd2232a6a70fe2d1f378d9f930cb77abfc2c92e6f3180d9ec444d613166e15e313b68350631b123a88b8c3603dcfe2c8405fe15b0c575b6b5619f586770d60bcc1e8818a931b844fc494b2a0536fbd33cf7008295527f4ce3cead97a5762ad1b61aa67f19a9478b83d597377f3a2b90fc64f4fb4b25c5cf14909b679aa5151ba2f28c351ea8c3d1bb0bae5065ee0342f947330d212753f86c9afa94c78c9344cc4b9093b47d30eda5de786a5b9efa3e0581d04b2d875a15396576dd2619957f3fd4b6b0948650669c96722ae8b4fe91c78dc61a4e4befb7d356200ed22edc4e5e453e60ef4baad6041046e6efe67a4fd650f82a389973752ef9",
    ),
    Song(
      id: 42,
      specId: 12,
      name: "Charchadim ona",
      urlImage: "https://i.ytimg.com/vi/BWSQ9N-T2AU/maxresdefault.jpg",
      url:
      "https://storage.googleapis.com/musicapp-api/Songs/Nahide_Babashl%C4%B1_-_Bu_Ak%C5%9Fam_%C3%96l%C3%BCr%C3%BCm__256kbps_cbr_.mp3?X-Goog-Algorithm=GOOG4-RSA-SHA256&X-Goog-Credential=music-api%40protean-willow-407916.iam.gserviceaccount.com%2F20240111%2Fauto%2Fstorage%2Fgoog4_request&X-Goog-Date=20240111T114005Z&X-Goog-Expires=86400&X-Goog-SignedHeaders=host&X-Goog-Signature=3bd78e707cb23cd2232a6a70fe2d1f378d9f930cb77abfc2c92e6f3180d9ec444d613166e15e313b68350631b123a88b8c3603dcfe2c8405fe15b0c575b6b5619f586770d60bcc1e8818a931b844fc494b2a0536fbd33cf7008295527f4ce3cead97a5762ad1b61aa67f19a9478b83d597377f3a2b90fc64f4fb4b25c5cf14909b679aa5151ba2f28c351ea8c3d1bb0bae5065ee0342f947330d212753f86c9afa94c78c9344cc4b9093b47d30eda5de786a5b9efa3e0581d04b2d875a15396576dd2619957f3fd4b6b0948650669c96722ae8b4fe91c78dc61a4e4befb7d356200ed22edc4e5e453e60ef4baad6041046e6efe67a4fd650f82a389973752ef9",
    ),
    Song(
      id: 43,
      specId: 12,
      name: "Sevganmisiz",
      urlImage: "https://i.ytimg.com/vi/Ig3wsSWhdOE/maxresdefault.jpg",
      url:
      "https://storage.googleapis.com/musicapp-api/Songs/Nahide_Babashl%C4%B1_-_Bu_Ak%C5%9Fam_%C3%96l%C3%BCr%C3%BCm__256kbps_cbr_.mp3?X-Goog-Algorithm=GOOG4-RSA-SHA256&X-Goog-Credential=music-api%40protean-willow-407916.iam.gserviceaccount.com%2F20240111%2Fauto%2Fstorage%2Fgoog4_request&X-Goog-Date=20240111T114005Z&X-Goog-Expires=86400&X-Goog-SignedHeaders=host&X-Goog-Signature=3bd78e707cb23cd2232a6a70fe2d1f378d9f930cb77abfc2c92e6f3180d9ec444d613166e15e313b68350631b123a88b8c3603dcfe2c8405fe15b0c575b6b5619f586770d60bcc1e8818a931b844fc494b2a0536fbd33cf7008295527f4ce3cead97a5762ad1b61aa67f19a9478b83d597377f3a2b90fc64f4fb4b25c5cf14909b679aa5151ba2f28c351ea8c3d1bb0bae5065ee0342f947330d212753f86c9afa94c78c9344cc4b9093b47d30eda5de786a5b9efa3e0581d04b2d875a15396576dd2619957f3fd4b6b0948650669c96722ae8b4fe91c78dc61a4e4befb7d356200ed22edc4e5e453e60ef4baad6041046e6efe67a4fd650f82a389973752ef9",
    ),
    Song(
      id: 44,
      specId: 12,
      name: "Kechagina oqshomlari",
      urlImage: "https://i.ytimg.com/vi/9aih1iZ4hns/maxresdefault.jpg",
      url:
      "https://storage.googleapis.com/musicapp-api/Songs/Nahide_Babashl%C4%B1_-_Bu_Ak%C5%9Fam_%C3%96l%C3%BCr%C3%BCm__256kbps_cbr_.mp3?X-Goog-Algorithm=GOOG4-RSA-SHA256&X-Goog-Credential=music-api%40protean-willow-407916.iam.gserviceaccount.com%2F20240111%2Fauto%2Fstorage%2Fgoog4_request&X-Goog-Date=20240111T114005Z&X-Goog-Expires=86400&X-Goog-SignedHeaders=host&X-Goog-Signature=3bd78e707cb23cd2232a6a70fe2d1f378d9f930cb77abfc2c92e6f3180d9ec444d613166e15e313b68350631b123a88b8c3603dcfe2c8405fe15b0c575b6b5619f586770d60bcc1e8818a931b844fc494b2a0536fbd33cf7008295527f4ce3cead97a5762ad1b61aa67f19a9478b83d597377f3a2b90fc64f4fb4b25c5cf14909b679aa5151ba2f28c351ea8c3d1bb0bae5065ee0342f947330d212753f86c9afa94c78c9344cc4b9093b47d30eda5de786a5b9efa3e0581d04b2d875a15396576dd2619957f3fd4b6b0948650669c96722ae8b4fe91c78dc61a4e4befb7d356200ed22edc4e5e453e60ef4baad6041046e6efe67a4fd650f82a389973752ef9",
    ),
    Song(
      id: 45,
      specId: 13,
      name: "Yom'girlar ostida",
      urlImage:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSJSJF2BNb7DfpkNUWqzDZVr8J24RJ7pH0raA&usqp=CAU",
      url:
      "https://storage.googleapis.com/musicapp-api/Songs/Nahide_Babashl%C4%B1_-_Bu_Ak%C5%9Fam_%C3%96l%C3%BCr%C3%BCm__256kbps_cbr_.mp3?X-Goog-Algorithm=GOOG4-RSA-SHA256&X-Goog-Credential=music-api%40protean-willow-407916.iam.gserviceaccount.com%2F20240111%2Fauto%2Fstorage%2Fgoog4_request&X-Goog-Date=20240111T114005Z&X-Goog-Expires=86400&X-Goog-SignedHeaders=host&X-Goog-Signature=3bd78e707cb23cd2232a6a70fe2d1f378d9f930cb77abfc2c92e6f3180d9ec444d613166e15e313b68350631b123a88b8c3603dcfe2c8405fe15b0c575b6b5619f586770d60bcc1e8818a931b844fc494b2a0536fbd33cf7008295527f4ce3cead97a5762ad1b61aa67f19a9478b83d597377f3a2b90fc64f4fb4b25c5cf14909b679aa5151ba2f28c351ea8c3d1bb0bae5065ee0342f947330d212753f86c9afa94c78c9344cc4b9093b47d30eda5de786a5b9efa3e0581d04b2d875a15396576dd2619957f3fd4b6b0948650669c96722ae8b4fe91c78dc61a4e4befb7d356200ed22edc4e5e453e60ef4baad6041046e6efe67a4fd650f82a389973752ef9",
    ),
    Song(
      id: 46,
      specId: 13,
      name: "Yolg'izman",
      urlImage: "https://i.ytimg.com/vi/g4M0TYdP0Sk/maxresdefault.jpg",
      url:
      "https://storage.googleapis.com/musicapp-api/Songs/Nahide_Babashl%C4%B1_-_Bu_Ak%C5%9Fam_%C3%96l%C3%BCr%C3%BCm__256kbps_cbr_.mp3?X-Goog-Algorithm=GOOG4-RSA-SHA256&X-Goog-Credential=music-api%40protean-willow-407916.iam.gserviceaccount.com%2F20240111%2Fauto%2Fstorage%2Fgoog4_request&X-Goog-Date=20240111T114005Z&X-Goog-Expires=86400&X-Goog-SignedHeaders=host&X-Goog-Signature=3bd78e707cb23cd2232a6a70fe2d1f378d9f930cb77abfc2c92e6f3180d9ec444d613166e15e313b68350631b123a88b8c3603dcfe2c8405fe15b0c575b6b5619f586770d60bcc1e8818a931b844fc494b2a0536fbd33cf7008295527f4ce3cead97a5762ad1b61aa67f19a9478b83d597377f3a2b90fc64f4fb4b25c5cf14909b679aa5151ba2f28c351ea8c3d1bb0bae5065ee0342f947330d212753f86c9afa94c78c9344cc4b9093b47d30eda5de786a5b9efa3e0581d04b2d875a15396576dd2619957f3fd4b6b0948650669c96722ae8b4fe91c78dc61a4e4befb7d356200ed22edc4e5e453e60ef4baad6041046e6efe67a4fd650f82a389973752ef9",
    ),
    Song(
      id: 47,
      specId: 13,
      name: "Unutasan jim",
      urlImage:
          "https://nevomusic.net/wp-content/uploads/2023/01/Fayzulloh-Zokirov-Unutasan-jim-400x400-1.jpg",
      url:
          "https://storage.googleapis.com/musicapp-api/Songs/Nahide_Babashl%C4%B1_-_Bu_Ak%C5%9Fam_%C3%96l%C3%BCr%C3%BCm__256kbps_cbr_.mp3?X-Goog-Algorithm=GOOG4-RSA-SHA256&X-Goog-Credential=music-api%40protean-willow-407916.iam.gserviceaccount.com%2F20240111%2Fauto%2Fstorage%2Fgoog4_request&X-Goog-Date=20240111T114005Z&X-Goog-Expires=86400&X-Goog-SignedHeaders=host&X-Goog-Signature=3bd78e707cb23cd2232a6a70fe2d1f378d9f930cb77abfc2c92e6f3180d9ec444d613166e15e313b68350631b123a88b8c3603dcfe2c8405fe15b0c575b6b5619f586770d60bcc1e8818a931b844fc494b2a0536fbd33cf7008295527f4ce3cead97a5762ad1b61aa67f19a9478b83d597377f3a2b90fc64f4fb4b25c5cf14909b679aa5151ba2f28c351ea8c3d1bb0bae5065ee0342f947330d212753f86c9afa94c78c9344cc4b9093b47d30eda5de786a5b9efa3e0581d04b2d875a15396576dd2619957f3fd4b6b0948650669c96722ae8b4fe91c78dc61a4e4befb7d356200ed22edc4e5e453e60ef4baad6041046e6efe67a4fd650f82a389973752ef9",
    ),
  ];
  List<Artist> artists = [
    Artist(
      id: 1,
      specId: 1,
      artistName: "Dua Lipa",
      urlImage:
          "https://s.france24.com/media/display/78bad01c-0766-11e9-bc4f-005056a964fe/w:1280/p:1x1/dua_lipa.jpg",
    ),
    Artist(
      id: 2,
      specId: 2,
      artistName: "Nahide Babasli",
      urlImage:
          "https://lastfm.freetls.fastly.net/i/u/ar0/b4d9d4718353f71c83f65950c5f2f617.jpg",
    ),
    Artist(
      id: 0,
      specId: 0,
      artistName: "Billie Eilish",
      urlImage:
          "https://www.thesun.co.uk/wp-content/uploads/2019/04/NINTCHDBPICT000481675400-e1554758519741.jpg",
    ),
    Artist(
      id: 5,
      specId: 3,
      artistName: "Selena Gomez",
      urlImage: "https://www.thehansindia.com/assets/singer(13).jpg",
    ),
    Artist(
      id: 6,
      specId: 4,
      artistName: "Taylor Swift",
      urlImage:
          "https://s.yimg.com/ny/api/res/1.2/jOg1JoN980x.Vqq1iikcqw--/YXBwaWQ9aGlnaGxhbmRlcjt3PTY0MDtoPTQ4MA--/https://media.zenfs.com/en/sheknows_79/3573e22b533b3f7d2bfe59ee7a0101f4",
    ),
    Artist(
      id: 7,
      specId: 5,
      artistName: "Inna",
      urlImage: "https://thumbs.dreamstime.com/z/inna-65810351.jpg",
    ),
    Artist(
      id: 8,
      specId: 6,
      artistName: "Benom",
      urlImage:
          "https://cdns-images.dzcdn.net/images/cover/6a9903dda31ddf62baed4e4fb059796e/264x264.jpg",
    ),
    Artist(
      id: 9,
      specId: 7,
      artistName: "Jaloldin Ahmadaliyev",
      urlImage:
          "https://viberatecdn.blob.core.windows.net/entity/artist/jaloliddin-ahmadaliyev-oUog6",
    ),
    Artist(
      id: 10,
      specId: 8,
      artistName: "Botir Qodirov",
      urlImage:
          "https://is1-ssl.mzstatic.com/image/thumb/Music115/v4/82/1e/e9/821ee9b4-6494-88ef-ebb7-c76828ad9e4f/8720205897022.png/486x486bb.png",
    ),
    Artist(
      id: 11,
      specId: 9,
      artistName: "Ozodbek Nazarbekov",
      urlImage: "https://i.ytimg.com/vi/OQRxpPs7A08/maxresdefault.jpg",
    ),
    Artist(
      id: 12,
      specId: 10,
      artistName: "Zahida",
      urlImage:
          "https://yt3.googleusercontent.com/ytc/APkrFKbodDUHoa7ahyVMPeQ4KbHwDax3dWDZ8afJ25h_=s900-c-k-c0x00ffffff-no-rj",
    ),
    Artist(
      id: 13,
      specId: 11,
      artistName: "Doston Ergashev",
      urlImage:
          "https://cdns-images.dzcdn.net/images/artist/4e71c2e204564e2bcbec785abe979598/500x500.jpg",
    ),
    Artist(
      id: 14,
      specId: 12,
      artistName: "Shohruh Ergashev",
      urlImage:
          "https://cdn.iticket.uz/event/poster_square/Xkcj8VCjSYtnEJlgc0Wimwx7TkbPdSf3MQbnVrs1.jpg",
    ),
    Artist(
      id: 15,
      specId: 13,
      artistName: "Fayzullo Zokirov",
      urlImage:
          "https://is1-ssl.mzstatic.com/image/thumb/Music122/v4/e8/8a/e6/e88ae617-328d-b46e-3427-12e67806fb46/2_001_Fayzulloh_Zokirov_-_Yolg_izman.jpg/486x486bb.png",
    ),
  ];

  final List<Color> colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.orange,
    Colors.purple,
    Colors.yellow,
  ];
}
