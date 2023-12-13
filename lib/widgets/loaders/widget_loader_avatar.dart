import 'package:flutter/material.dart';
import 'package:photo_gallery/widgets/loaders/widget_placeholders.dart';
import 'package:shimmer/shimmer.dart';

class WidgetLoaderAvatar extends StatelessWidget {
  const WidgetLoaderAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).colorScheme.surfaceVariant,
      highlightColor: Theme.of(context).colorScheme.primaryContainer,
      child: const AvatarImagePlaceHolder(),
    );
  }
}
