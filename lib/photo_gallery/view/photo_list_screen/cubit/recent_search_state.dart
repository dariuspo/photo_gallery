part of 'recent_search_cubit.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class RecentSearchState {
  RecentSearchState({
    this.recentSearches = const <String>{},
  });

  final Set<String> recentSearches;
}
