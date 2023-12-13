import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_gallery/app/view/theme/spacer.dart';
import 'package:photo_gallery/photo_gallery/data/repositories/unsplash_repository.dart';
import 'package:photo_gallery/photo_gallery/view/photo_list_screen/bloc/photo_list_bloc.dart';
import 'package:photo_gallery/photo_gallery/view/photo_list_screen/cubit/recent_search_cubit.dart';
import 'package:photo_gallery/photo_gallery/view/photo_list_screen/view/photo_list_view.dart';
import 'package:photo_gallery/photo_gallery/view/photo_list_screen/view/seach_widget.dart';

@RoutePage()
class PhotoListScreen extends StatelessWidget {
  const PhotoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
          PhotoListBloc(
            context.read<UnsplashRepository>(),
          )
            ..add(FetchPhotos()),
        ),
        BlocProvider(
          create: (context) => RecentSearchCubit(),
        ),
      ],
      child: const Scaffold(
        body: SafeArea(
          child: Padding(
            padding: kPagePadding,
            child: Column(
              children: [
                SearchWidget(),
                Expanded(
                  child: PhotoListView(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
