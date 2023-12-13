import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_gallery/app/bloc/bloc_helper.dart';
import 'package:photo_gallery/app/utils/date_time_extensions.dart';
import 'package:photo_gallery/app/utils/num_extensions.dart';
import 'package:photo_gallery/app/view/theme/spacer.dart';
import 'package:photo_gallery/photo_gallery/data/models/photo/photo.dart';
import 'package:photo_gallery/photo_gallery/view/photo_detail_screen/cubit/photo_detail_cubit.dart';
import 'package:photo_gallery/widgets/loaders/widget_loader_text_wall.dart';
import 'package:photo_gallery/widgets/pages/widget_error.dart';

class DetailedPhotoInfo extends StatelessWidget {
  const DetailedPhotoInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<PhotoDetailCubit>().state;
    final detailPhoto = state.detailedPhoto;
    return blocBuilderWrapper(
      blocState: state.blocState,
      loadingBuilder: const Padding(
        padding: kPagePadding,
        child: WidgetLoaderTextWall(),
      ),
      finishedBuilder: detailPhoto == null
          ? const SizedBox()
          : Padding(
              padding: kPagePadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Views:',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  Text(detailPhoto.views?.formatNumber() ?? ''),
                  mediumGap,
                  Text(
                    'Downloads:',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  Text(detailPhoto.downloads?.formatNumber() ?? ''),
                  mediumGap,
                  buildPhotoDescription(detailPhoto),
                  buildLocation(
                    icon: Icons.pin_drop_outlined,
                    title: detailPhoto.location?.name ?? '',
                  ),
                  buildLocation(
                    icon: Icons.calendar_month,
                    title:
                        'Published on '
                            '${detailPhoto.createdAt?.formatMMMddYYYY() ?? ''}',
                  ),
                  smallGap,
                  Wrap(
                    spacing: 12,
                    children: detailPhoto.tags
                        .map(
                          (e) => Chip(
                            label: Text(e.titleView),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 4,
                              vertical: 2,
                            ),
                            visualDensity: VisualDensity.compact,
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),
      failedBuilder: WidgetError(
        message: state.message,
        retry: () => context.read<PhotoDetailCubit>().getDetailedPhoto(),
      ),
    );
  }

  Widget buildLocation({required IconData icon, String? title}) {
    return Visibility(
      visible: title?.isNotEmpty ?? false,
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                icon,
                size: 15,
              ),
              smallGap,
              Expanded(
                child: Text(title ?? ''),
              ),
            ],
          ),
          smallGap,
        ],
      ),
    );
  }

  Visibility buildPhotoDescription(Photo detailPhoto) {
    return Visibility(
      visible: detailPhoto.description?.isNotEmpty ?? false,
      child: Column(
        children: [
          Text(detailPhoto.description ?? ''),
          mediumGap,
        ],
      ),
    );
  }
}
