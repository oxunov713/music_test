import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:music_test/src/data/models/fake_data.dart';
import 'package:shimmer/shimmer.dart';

class YourTopSongsList extends StatelessWidget {
  YourTopSongsList({super.key});

  final fakeData = FakeData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your top songs"),
      ),
      body: Center(),
    );
  }
}
