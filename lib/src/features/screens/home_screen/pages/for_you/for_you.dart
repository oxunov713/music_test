import 'package:flutter/material.dart';
import 'package:music_test/src/data/providers/recently/recently_provider.dart';
import 'package:provider/provider.dart';

import 'mixes/mixes_sliver.dart';
import 'mixes/mixes_text.dart';
import 'recently/recently_sliver.dart';
import 'recently/recently_text.dart';
import 'your_favourite_albums/your_favourite_album_text.dart';
import 'your_favourite_albums/your_favourite_albums.dart';
import 'your_radios/your_radio_text.dart';
import 'your_radios/your_radios_sliver.dart';
import 'your_top_artists/your_top_artist_text.dart';
import 'your_top_artists/your_top_artists.dart';
import 'your_top_songs/top_songs_sliver.dart';
import 'your_top_songs/top_text.dart';

class ForYouPage extends StatefulWidget {
  const ForYouPage({super.key});

  @override
  State<ForYouPage> createState() => _ForYouPageState();
}

class _ForYouPageState extends State<ForYouPage> {
  late RecentlyPlayedProvider provider;

  @override
  void didChangeDependencies() {
    provider = context.watch<RecentlyPlayedProvider>();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          //recently
          RecentlyText(),
          RecentlySliver(),
          //mixes
          MixesText(),
          MixesSliver(),
          //top songs
          YourTopSongsText(),
          YourTopSongsSliver(),
          //top artists
          YourTopArtistText(),
          YourTopArtistsSliver(),
          //radios
          YourRadiosText(),
          YourRadiosSliver(),
          //favourite albums
          YourFavouriteAlbumText(),
          YourFavouriteAlbumsSliver(),
        ],
      ),
    );
  }
}
