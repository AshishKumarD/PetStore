import 'package:flutter/material.dart';

class PetHero extends StatelessWidget {
  final String image;
  const PetHero({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: image,
      child: Image.network(
        image,
        fit: BoxFit.fill,
      ),
    );
  }
}
