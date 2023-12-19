import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomInkwell extends StatelessWidget {
  const CustomInkwell({super.key, required this.svgPicture});

  final SvgPicture svgPicture;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.all(Radius.circular(15)),
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          border: Border.all(color: Colors.grey),
        ),
        child: Center(
          child: svgPicture,
        ),
      ),
    );
  }
}
