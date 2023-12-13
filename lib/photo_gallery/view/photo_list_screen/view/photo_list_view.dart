import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:photo_gallery/app/bloc/bloc_helper.dart';
import 'package:photo_gallery/app/router/app_router.dart';
import 'package:photo_gallery/app/view/theme/spacer.dart';
import 'package:photo_gallery/photo_gallery/view/photo_list_screen/bloc/photo_list_bloc.dart';
import 'package:photo_gallery/photo_gallery/view/photo_list_screen/view/user_info.dart';
import 'package:photo_gallery/widgets/images/widget_image.dart';
import 'package:photo_gallery/widgets/loaders/widget_loader_grid.dart';
import 'package:photo_gallery/widgets/pages/widget_error.dart';
import 'package:photo_gallery/widgets/pages/widget_loading.dart';

class PhotoListView extends StatelessWidget {
  const PhotoListView({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<PhotoListBloc>().state;
    return blocBuilderWrapper(
      blocState: state.blocState,
      loadingBuilder: const WidgetLoaderGrid(),
      failedBuilder: WidgetError(
        message: state.message,
        retry: () => context.read<PhotoListBloc>().add(FetchPhotos()),
      ),
      finishedBuilder: NotificationListener(
        onNotification: (notification) {
          if (notification is ScrollEndNotification) {
            final maxScroll = notification.metrics.pixels;
            final currentScroll = notification.metrics.maxScrollExtent;
            if (currentScroll == maxScroll) {
              context.read<PhotoListBloc>().add(FetchPhotos());
            }
          }
          return true;
        },
        child: state.photos.isEmpty
            ? WidgetError(
                message: "Cannot find result for ${state.query}",
                retry: () => context.read<PhotoListBloc>().add(
                      SearchPhotos(query: ''),
                    ),
                retryText: "Clear Filter",
              )
            : MasonryGridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                mainAxisSpacing: gridSpacing,
                crossAxisSpacing: gridSpacing,
                itemCount: state.photos.length,
                itemBuilder: (context, index) {
                  final photo = state.photos[index];
                  return Column(
                    children: [
                      smallGap,
                      GestureDetector(
                        onTap: () => context.router.push(
                          PhotoDetailRoute(photo: photo),
                        ),
                        child: Hero(
                          tag: photo.urls?.regular ?? '',
                          child: WidgetImage(
                            url: photo.urls?.regular,
                            blurHash: photo.blurHash,
                            size: Size(
                              photo.width?.toDouble() ?? 0,
                              photo.height?.toDouble() ?? 0,
                            ),
                          ),
                        ),
                      ),
                      smallGap,
                      UserInfo(user: photo.user),
                      Visibility(
                        visible: state.photos.length - 1 == index,
                        child: const WidgetLoading(),
                      ),
                    ],
                  );
                },
              ),
      ),
    );
  }
}
