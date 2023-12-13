import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';

part 'recent_search_cubit.g.dart';

part 'recent_search_state.dart';

class RecentSearchCubit extends HydratedCubit<RecentSearchState> {
  RecentSearchCubit() : super(RecentSearchState());

  void addSearch(String string) {
    final mySet = Set<String>.from(state.recentSearches)..add(string);
    emit(RecentSearchState(recentSearches: mySet));
  }

  void removeSearch(String string) {
    final mySet = state.recentSearches..remove(string);
    emit(RecentSearchState(recentSearches: mySet));
  }

  @override
  RecentSearchState? fromJson(Map<String, dynamic> json) {
    return _$RecentSearchStateFromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(RecentSearchState state) {
    return _$RecentSearchStateToJson(state);
  }
}
