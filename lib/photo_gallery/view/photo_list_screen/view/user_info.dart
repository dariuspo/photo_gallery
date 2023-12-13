import 'package:flutter/material.dart';
import 'package:photo_gallery/app/view/theme/spacer.dart';
import 'package:photo_gallery/photo_gallery/data/models/models.dart';
import 'package:photo_gallery/widgets/images/widget_avatar_image.dart';

class UserInfo extends StatelessWidget {

  const UserInfo({
    super.key,
    this.user,
  });
  final User? user;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        WidgetAvatarImage(
          url: user?.profileImage?.small,
        ),
        smallGap,
        Expanded(
          child: Text(
            user?.username ?? '',
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ),
      ],
    );
  }
}
