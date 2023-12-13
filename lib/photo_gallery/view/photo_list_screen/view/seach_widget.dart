import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_gallery/app/bloc/bloc_helper.dart';
import 'package:photo_gallery/dark_mode/cubit/theme_cubit.dart';
import 'package:photo_gallery/photo_gallery/view/photo_list_screen/bloc/photo_list_bloc.dart';
import 'package:photo_gallery/photo_gallery/view/photo_list_screen/cubit/recent_search_cubit.dart';
import 'package:photo_gallery/photo_gallery/view/photo_list_screen/view/suggestion_widget.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({super.key});

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final SearchController searchController = SearchController();

  @override
  void initState() {
    super.initState();
    searchController.addListener(searchListener);
  }

  @override
  void dispose() {
    searchController
      ..removeListener(searchListener)
      ..dispose();
    super.dispose();
  }

  void searchListener() {
    if (searchController.text.isEmpty) {
      context.read<PhotoListBloc>().add(SearchPhotos(query: ''));
    }
  }

  @override
  Widget build(BuildContext context) {
    final query = context.select((PhotoListBloc value) => value.state.query);

    final value = context.watch<ThemeCubit>().state;
    late bool isDarkMode;
    if (value == ThemeMode.system) {
      final brightness = MediaQuery.of(context).platformBrightness;
      isDarkMode = brightness == Brightness.dark;
    } else {
      isDarkMode = value == ThemeMode.dark;
    }
    return BlocListener<PhotoListBloc, PhotoListState>(
      listenWhen: (prev, curr) => curr.blocState.isSuccess,
      listener: (context, state) {
        if (state.query.isEmpty) {
          setState(() {
            searchController.clear();
          });
        }
      },
      child: SearchAnchor(
        searchController: searchController,
        builder: (BuildContext context, SearchController controller) {
          return TextFormField(
            controller: controller,
            readOnly: true,
            onTap: () {
              controller.openView();
            },
            onChanged: (value) {
              controller.openView();
            },
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              suffixIcon: Tooltip(
                message: 'Change brightness mode',
                child: IconButton(
                  isSelected: isDarkMode,
                  onPressed: () {
                    context.read<ThemeCubit>().changeTheme(
                          isDarkMode: !isDarkMode,
                        );
                  },
                  icon: const Icon(Icons.wb_sunny_outlined),
                  selectedIcon: const Icon(Icons.brightness_2_outlined),
                ),
              ),
            ),
          );
        },
        suggestionsBuilder: (BuildContext _, SearchController controller) {
          return [
            MultiBlocProvider(
              providers: [
                BlocProvider.value(
                  value: context.read<RecentSearchCubit>(),
                ),
                BlocProvider.value(
                  value: context.read<PhotoListBloc>(),
                ),
              ],
              child: SuggestionWidget(
                controller: controller,
                query: query,
              ),
            ),
          ];
        },
      ),
    );
  }
}
