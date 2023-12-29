import 'package:flutter/material.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundImage: NetworkImage(
          "https://i.scdn.co/image/ab67706c0000da845d58739ab68aae003ab5ec87"),
      radius: 25,
    );
  }
}
