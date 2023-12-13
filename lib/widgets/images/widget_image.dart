import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:photo_gallery/widgets/loaders/widget_placeholders.dart';

class WidgetImage extends StatelessWidget {

  const WidgetImage({
    super.key,
    this.url,
    this.blurHash,
    this.size,
  });
  final String? url;
  final String? blurHash;
  final Size? size;

  @override
  Widget build(BuildContext context) {
    return url?.isEmpty ?? true
        ? const Icon(Icons.error)
        : CachedNetworkImage(
            imageUrl: url!,
            placeholder: (context, url) => blurHash == null
                ? const ImagePlaceHolder()
                : AspectRatio(
                    aspectRatio: size != null ? size!.width / size!.height : 1,
                    child: BlurHash(hash: blurHash!),
                  ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          );
  }
}
