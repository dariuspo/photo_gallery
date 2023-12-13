import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:photo_gallery/photo_gallery/data/models/photo/photo.dart';
import 'package:photo_gallery/photo_gallery/view/photo_detail_screen/photo_detail_screen.dart';
import 'package:photo_gallery/photo_gallery/view/photo_list_screen/photo_list_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route',)
class AppRouter extends _$AppRouter {

  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: PhotoListRoute.page, initial: true),
    AutoRoute(page: PhotoDetailRoute.page),
  ];
}
