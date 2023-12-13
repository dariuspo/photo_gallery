// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recent_search_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecentSearchState _$RecentSearchStateFromJson(Map<String, dynamic> json) =>
    RecentSearchState(
      recentSearches: (json['recent_searches'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toSet() ??
          const <String>{},
    );

Map<String, dynamic> _$RecentSearchStateToJson(RecentSearchState instance) =>
    <String, dynamic>{
      'recent_searches': instance.recentSearches.toList(),
    };
