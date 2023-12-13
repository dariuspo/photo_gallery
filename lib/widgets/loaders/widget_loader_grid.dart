import 'package:flutter/material.dart';
import 'package:photo_gallery/app/view/theme/spacer.dart';
import 'package:photo_gallery/widgets/loaders/widget_placeholders.dart';
import 'package:shimmer/shimmer.dart';

class WidgetLoaderGrid extends StatelessWidget {
  const WidgetLoaderGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.only(top: 5),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: gridSpacing,
        mainAxisSpacing: gridSpacing,
        childAspectRatio: 1.2,
      ),
      children: List.generate(
        10,
        (index) => Shimmer.fromColors(
          baseColor: Theme.of(context).colorScheme.surfaceVariant,
          highlightColor: Theme.of(context).colorScheme.primaryContainer,
          child: const ImagePlaceHolder(),
        ),
      ),
    );
  }
}
