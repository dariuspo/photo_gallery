import 'package:flutter/material.dart';

class ImagePlaceHolder extends StatelessWidget {
  const ImagePlaceHolder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
    );
  }
}

class AvatarImagePlaceHolder extends StatelessWidget {
  const AvatarImagePlaceHolder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
    );
  }
}

class TextPlaceHolder extends StatelessWidget {
  const TextPlaceHolder({
    required this.width, super.key,
  });
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 15,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
    );
  }
}
