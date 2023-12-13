import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_gallery/app/view/theme/spacer.dart';
import 'package:photo_gallery/photo_gallery/view/photo_list_screen/bloc/photo_list_bloc.dart';
import 'package:photo_gallery/photo_gallery/view/photo_list_screen/cubit/recent_search_cubit.dart';

class SuggestionWidget extends StatelessWidget {
  const SuggestionWidget({
    required this.controller,
    required this.query,
    super.key,
  });

  final String query;
  final SearchController controller;

  @override
  Widget build(BuildContext context) {
    final recentSearch =
        context.watch<RecentSearchCubit>().state.recentSearches;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: controller.text.isNotEmpty,
          child: ListTile(
            leading: const Icon(Icons.search),
            title: Text(controller.text),
            onTap: () {
              if (controller.text.length < 3) return;
              context.read<PhotoListBloc>().add(
                    SearchPhotos(query: controller.text),
                  );
              context.read<RecentSearchCubit>().addSearch(controller.text);
              controller.closeView(controller.text);
            },
          ),
        ),
        Visibility(
          visible: query.isNotEmpty,
          child: ListTile(
            leading: const Icon(Icons.clear),
            title: const Text('Clear Search'),
            onTap: () {
              controller.clear();
              context.read<PhotoListBloc>().add(
                    SearchPhotos(query: ''),
                  );
              controller.closeView('');
            },
          ),
        ),
        mediumGap,
        Visibility(
          visible: recentSearch.isNotEmpty,
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text('Recent Search:'),
          ),
        ),
        Visibility(
          visible: recentSearch.isNotEmpty,
          child: Padding(
            padding: kPagePadding,
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              children: recentSearch
                  .map(
                    (e) => GestureDetector(
                      onTap: () {
                        context.read<PhotoListBloc>().add(
                              SearchPhotos(query: e),
                            );
                        controller.closeView(e);
                      },
                      child: Chip(
                        label: Text(e),
                        deleteIcon: const Icon(
                          Icons.clear,
                          size: 15,
                        ),
                        onDeleted: () {
                          context.read<RecentSearchCubit>().removeSearch(e);
                        },
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
