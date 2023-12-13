import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_gallery/photo_gallery/data/models/models.dart';
import 'package:photo_gallery/photo_gallery/data/repositories/unsplash_repository.dart';
import 'package:photo_gallery/photo_gallery/view/photo_detail_screen/cubit/photo_detail_cubit.dart';
import 'package:photo_gallery/photo_gallery/view/photo_detail_screen/view/photo_detail_view.dart';

@RoutePage()
class PhotoDetailScreen extends StatelessWidget {

  const PhotoDetailScreen({required this.photo, super.key});
  final Photo photo;

  @override
  Widget build(BuildContext context) {
    //BlocProvider used so we can passing photo data to all child widget
    //this will be useful when we refactoring widget.
    return BlocProvider(
      create: (context) => PhotoDetailCubit(
        context.read<UnsplashRepository>(),
        photo,
      )..getDetailedPhoto(),
      child: Scaffold(
        appBar: AppBar(),
        body: const SafeArea(
          child: PhotoDetailView(),
        ),
      ),
    );
  }
}
