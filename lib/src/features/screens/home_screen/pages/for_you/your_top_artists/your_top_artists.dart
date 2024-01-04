import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:text_marquee/text_marquee.dart';


import '../../../../../../data/models/fake_data.dart';
import '../../../../../../data/providers/home_screen_provider.dart';
import '../../../../../../data/providers/player_provider.dart';

class YourTopArtistsSliver extends StatefulWidget {
  const YourTopArtistsSliver({super.key});

  @override
  State<YourTopArtistsSliver> createState() => _YourTopArtistsSliverState();
}

class _YourTopArtistsSliverState extends State<YourTopArtistsSliver> {
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
          height: 120,
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  viewModelRead
                    ..changeCurrentSingerCardImage(fakeData.gridUrls[index])
                    ..changeCurrentSingeCardName(
                        fakeData.artists.keys.elementAt(index));

                  Navigator.pushNamed(context, "/artists");
                },
                child: SizedBox.square(
                  dimension: 120,
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(fakeData.gridUrls[index]),
                        radius: 45,
                      ),
                      SizedBox(
                        width: 80,
                        child: Center(
                          child: TextMarquee(
                            "${fakeData.artists.keys.elementAt(index)}",
                            spaceSize: 30,
                            rtl: false,
                            delay: Duration(seconds: 1),
                            style: Theme.of(context).textTheme.titleMedium!,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(width: 10),
            itemCount: 10,
            scrollDirection: Axis.horizontal,
          ),
        ),
      ),
    );
  }
}
