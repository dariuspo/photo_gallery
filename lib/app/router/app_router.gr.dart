// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    PhotoDetailRoute.name: (routeData) {
      final args = routeData.argsAs<PhotoDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PhotoDetailScreen(
          photo: args.photo,
          key: args.key,
        ),
      );
    },
    PhotoListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PhotoListScreen(),
      );
    },
  };
}

/// generated route for
/// [PhotoDetailScreen]
class PhotoDetailRoute extends PageRouteInfo<PhotoDetailRouteArgs> {
  PhotoDetailRoute({
    required Photo photo,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          PhotoDetailRoute.name,
          args: PhotoDetailRouteArgs(
            photo: photo,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'PhotoDetailRoute';

  static const PageInfo<PhotoDetailRouteArgs> page =
      PageInfo<PhotoDetailRouteArgs>(name);
}

class PhotoDetailRouteArgs {
  const PhotoDetailRouteArgs({
    required this.photo,
    this.key,
  });

  final Photo photo;

  final Key? key;

  @override
  String toString() {
    return 'PhotoDetailRouteArgs{photo: $photo, key: $key}';
  }
}

/// generated route for
/// [PhotoListScreen]
class PhotoListRoute extends PageRouteInfo<void> {
  const PhotoListRoute({List<PageRouteInfo>? children})
      : super(
          PhotoListRoute.name,
          initialChildren: children,
        );

  static const String name = 'PhotoListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
