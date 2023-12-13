import 'package:flutter/material.dart';
import 'package:photo_gallery/app/view/theme/spacer.dart';
import 'package:photo_gallery/widgets/loaders/widget_placeholders.dart';
import 'package:shimmer/shimmer.dart';

class WidgetLoaderTextWall extends StatelessWidget {
  const WidgetLoaderTextWall({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Shimmer.fromColors(
          baseColor: Theme.of(context).colorScheme.surfaceVariant,
          highlightColor: Theme.of(context).colorScheme.primaryContainer,
          child: const TextPlaceHolder(width: 70),
        ),
        smallGap,
        Shimmer.fromColors(
          baseColor: Theme.of(context).colorScheme.surfaceVariant,
          highlightColor: Theme.of(context).colorScheme.primaryContainer,
          child: const TextPlaceHolder(width: 100),
        ),
        mediumGap,
        Shimmer.fromColors(
          baseColor: Theme.of(context).colorScheme.surfaceVariant,
          highlightColor: Theme.of(context).colorScheme.primaryContainer,
          child: const TextPlaceHolder(width: 70),
        ),
        smallGap,
        Shimmer.fromColors(
          baseColor: Theme.of(context).colorScheme.surfaceVariant,
          highlightColor: Theme.of(context).colorScheme.primaryContainer,
          child: const TextPlaceHolder(width: 100),
        ),
        mediumGap,
        Shimmer.fromColors(
          baseColor: Theme.of(context).colorScheme.surfaceVariant,
          highlightColor: Theme.of(context).colorScheme.primaryContainer,
          child: const TextPlaceHolder(width: double.infinity),
        ),
        smallGap,

        Shimmer.fromColors(
          baseColor: Theme.of(context).colorScheme.surfaceVariant,
          highlightColor: Theme.of(context).colorScheme.primaryContainer,
          child: const TextPlaceHolder(width: double.infinity),
        ),
        smallGap,

        Shimmer.fromColors(
          baseColor: Theme.of(context).colorScheme.surfaceVariant,
          highlightColor: Theme.of(context).colorScheme.primaryContainer,
          child: const TextPlaceHolder(width: 100),
        ),
        mediumGap,
        Shimmer.fromColors(
          baseColor: Theme.of(context).colorScheme.surfaceVariant,
          highlightColor: Theme.of(context).colorScheme.primaryContainer,
          child: const TextPlaceHolder(width: 300),
        ),
        smallGap,
        Shimmer.fromColors(
          baseColor: Theme.of(context).colorScheme.surfaceVariant,
          highlightColor: Theme.of(context).colorScheme.primaryContainer,
          child: const TextPlaceHolder(width: 250),
        ),
        smallGap,
        Shimmer.fromColors(
          baseColor: Theme.of(context).colorScheme.surfaceVariant,
          highlightColor: Theme.of(context).colorScheme.primaryContainer,
          child: const TextPlaceHolder(width: 270),
        ),
      ],
    );
  }
}
