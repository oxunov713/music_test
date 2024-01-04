import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../data/models/fake_data.dart';
import '../../../../../../data/providers/home_screen_provider.dart';
import '../../../../../../data/providers/player_provider.dart';
import 'mix_card.dart';

class MixesSliver extends StatefulWidget {
  const MixesSliver({super.key});

  @override
  State<MixesSliver> createState() => _MixesSliverState();
}

class _MixesSliverState extends State<MixesSliver> {
  late HomeScreenViewModel viewModelWatch;
  late HomeScreenViewModel viewModelRead;
  late PlayerViewModel playerRead;
  late PlayerViewModel playerWatch;

  final fakeData = FakeData();

  @override
  void didChangeDependencies() {
    viewModelWatch = context.watch<HomeScreenViewModel>();
    viewModelRead = context.read<HomeScreenViewModel>();
    playerRead = context.watch<PlayerViewModel>();
    playerWatch = context.read<PlayerViewModel>();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(top: 15, left: 10),
      sliver: SliverToBoxAdapter(
        child: SizedBox(
          height: 200,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      viewModelRead.currentMixNumber = index;
                      viewModelRead.changeCurrentMixArtists(index);
                      Navigator.pushNamed(context, "/mix_page");
                    },
                    child: MixCard(
                      artistName: viewModelRead.changeCurrentMixArtists(index),
                      imagePath: fakeData.gridUrls[index],
                      mixTitle: "Mix ${index + 1}",
                      index: index,
                    ),
                  ),
              separatorBuilder: (context, index) => const SizedBox(width: 15),
              itemCount: 6),
        ),
      ),
    );
  }
}
