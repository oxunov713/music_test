import 'package:flutter/material.dart';
import 'package:music_test/src/data/models/model.dart';

import '../../models/fake_data.dart';

class MixProvider extends ChangeNotifier {
  List<List<Artist>> mixArtistsList = List.generate(6, (index) => []);
  static final fakeData1 = FakeData();
  static final fakeData2 = FakeData();

  void getMixArtists() {
    final int artistsLength =
        fakeData1.artists.length + fakeData2.artists.length;

    // Shuffle the list of all artists
    List<Artist> allArtists =
        fakeData1.artists.toList() + fakeData2.artists.toList()
          ..shuffle();

    // Iterate over each mix index and assign a unique set of 4 artists
    for (int mixIndex = 0; mixIndex < 6; mixIndex++) {
      // Calculate the start index for the current set of 4 artists
      int startIndex = mixIndex * 4;

      // Ensure that there are enough artists for the current mix index
      if (startIndex + 4 <= artistsLength) {
        // Take the next 4 artists from the shuffled list
        List<Artist> selectedArtists =
            allArtists.sublist(startIndex, startIndex + 4);

        // Assign the selected artists to the current mix index
        mixArtistsList[mixIndex] = selectedArtists;
      } else {
        // Handle the case where there are not enough artists
        print('Not enough artists for mix $mixIndex');
      }
    }


  }
}
