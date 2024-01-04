import 'package:flutter/material.dart';


class YourRadiosSliver extends StatefulWidget {
  const YourRadiosSliver({super.key});

  @override
  State<YourRadiosSliver> createState() => _YourRadiosSliverState();
}

class _YourRadiosSliverState extends State<YourRadiosSliver> {
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(top: 15, bottom: 10),
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
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              "https://visitdpstudio.net/radio_world/upload/96542684-2023-02-15.png"),
                        ),
                      ),
                    ),
                    Text(
                      "Oriat Dono",
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
