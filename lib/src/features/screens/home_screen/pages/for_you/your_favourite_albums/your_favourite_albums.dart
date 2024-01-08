import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../data/models/fake_data.dart';
import '../../../../../../data/providers/home_screen_provider.dart';
import '../../../../../../data/providers/player/player_provider.dart';

class YourFavouriteAlbumsSliver extends StatefulWidget {
  const YourFavouriteAlbumsSliver({super.key});

  @override
  State<YourFavouriteAlbumsSliver> createState() =>
      _YourFavouriteAlbumsSliverState();
}

class _YourFavouriteAlbumsSliverState extends State<YourFavouriteAlbumsSliver> {
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
      padding: const EdgeInsets.symmetric(vertical: 15),
      sliver: SliverToBoxAdapter(
        child: SizedBox(
          height: 130,
          child: ListView.separated(
            physics: const ScrollPhysics(),
            itemBuilder: (context, index) {
              return SizedBox.square(
                dimension: 120,
                child: Column(
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(fakeData.musicList[index].urlImage),
                        ),
                      ),
                    ),
                    Text(
                      "Billie's album",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(width: 10),
            itemCount: 15,
            scrollDirection: Axis.horizontal,
          ),
        ),
      ),
    );
  }
}
