import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_gallery/widgets/loaders/widget_loader_avatar.dart';

class WidgetAvatarImage extends StatelessWidget {

  const WidgetAvatarImage({
    super.key,
    this.url,
  });
  final String? url;

  @override
  Widget build(BuildContext context) {
    return url?.isEmpty ?? true
        ? const Icon(Icons.person_2_rounded)
        : CachedNetworkImage(
            imageUrl: url!,
            imageBuilder: (context, image) => CircleAvatar(
              backgroundImage: image,
              radius: 15,
            ),
            placeholder: (context, url) => const WidgetLoaderAvatar(),
            errorWidget: (context, url, error) => const Icon(
              Icons.person_2_rounded,
            ),
          );
  }
}
