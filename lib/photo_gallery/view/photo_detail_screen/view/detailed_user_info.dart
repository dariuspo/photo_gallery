import 'package:flutter/material.dart';
import 'package:photo_gallery/app/view/theme/spacer.dart';
import 'package:photo_gallery/photo_gallery/data/models/models.dart';
import 'package:photo_gallery/photo_gallery/view/photo_list_screen/view/user_info.dart';

class DetailedUserInfo extends StatelessWidget {

  const DetailedUserInfo({
    super.key,
    this.user,
  });
  final User? user;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UserInfo(
          user: user,
        ),
        smallGap,
        Text(
          user?.bio ?? '',
          style: Theme.of(context).textTheme.bodySmall,

        ),
      ],
    );
  }
}
