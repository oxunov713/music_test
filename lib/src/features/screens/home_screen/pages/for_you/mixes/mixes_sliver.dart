
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../../common/styles/app_colors.dart';
import '../../../../../../common/tools/fonts.dart';
import '../../../../../../data/models/fake_data.dart';
import '../../../../../../data/providers/mixes/mixes_provider.dart';
import 'mix_cache_image.dart';
import 'mix_page.dart';

class MixesSliver extends StatefulWidget {
  const MixesSliver({super.key});

  @override
  State<MixesSliver> createState() => _MixesSliverState();
}

class _MixesSliverState extends State<MixesSliver> {
  late MixProvider _mixProvider;
  late MixProvider _mixProviderW;

  final fakeData = FakeData();

  @override
  void didChangeDependencies() {
    _mixProvider = context.read<MixProvider>();
    _mixProviderW = context.watch<MixProvider>();
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
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MixPage(
                        mixIndex: index,
                      ),
                    ),
                  );
                },
                child: Container(
                  width: 140,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.blue, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 120,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                CustomCached(
                                    url: _mixProviderW
                                        .mixArtistsList[index][0].urlImage),
                                CustomCached(
                                    url: _mixProviderW
                                        .mixArtistsList[index][1].urlImage),
                              ],
                            ),
                            Column(
                              children: [
                                CustomCached(
                                    url: _mixProviderW
                                        .mixArtistsList[index][2].urlImage),
                                CustomCached(
                                    url: _mixProviderW
                                        .mixArtistsList[index][3].urlImage),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "Mix ${index + 1}",
                        style:
                            Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  fontFamily: FontFamily.JosefinSans.fFamily,
                                  color: fakeData.colors[index],
                                  overflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(width: 15),
            itemCount: 6,
          ),
        ),
      ),
    );
  }
}
