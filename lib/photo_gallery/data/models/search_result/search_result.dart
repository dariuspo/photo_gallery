import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:photo_gallery/photo_gallery/data/models/models.dart';

part 'search_result.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class SearchResult extends Equatable {
  const SearchResult({
    this.total,
    this.totalPages,
    this.results,
  });

  factory SearchResult.fromJson(Map<String, dynamic> json) =>
      _$SearchResultFromJson(json);
  final int? total;
  final int? totalPages;
  final List<Photo>? results;

  Map<String, dynamic> toJson() => _$SearchResultToJson(this);

  @override
  List<Object?> get props => [total, totalPages, results];
}
