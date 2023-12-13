import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_gallery/app/view/theme/spacer.dart';
import 'package:photo_gallery/photo_gallery/view/photo_detail_screen/cubit/photo_detail_cubit.dart';
import 'package:photo_gallery/photo_gallery/view/photo_detail_screen/view/detailed_photo_info.dart';
import 'package:photo_gallery/photo_gallery/view/photo_list_screen/view/user_info.dart';
import 'package:photo_gallery/widgets/images/widget_image.dart';

class PhotoDetailView extends StatelessWidget {
  const PhotoDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final photo = context.select((PhotoDetailCubit value) => value.state.photo);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: kPagePadding,
            child: UserInfo(
              user: photo.user,
            ),
          ),
          Hero(
            tag: photo.urls?.regular ?? '',
            child: WidgetImage(
              url: photo.urls?.regular,
            ),
          ),
          smallGap,
          const DetailedPhotoInfo(),
        ],
      ),
    );
  }
}
