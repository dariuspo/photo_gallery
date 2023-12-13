import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:photo_gallery/photo_gallery/data/models/user/user.dart';

part 'user_collection.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class UserCollection extends Equatable {
  const UserCollection({
    this.id,
    this.title,
    this.publishedAt,
    this.lastCollectedAt,
    this.updatedAt,
    this.coverPhoto,
    this.user,
  });

  factory UserCollection.fromJson(Map<String, dynamic> json) =>
      _$UserCollectionFromJson(json);

  final int? id;
  final String? title;
  final DateTime? publishedAt;
  final DateTime? lastCollectedAt;
  final DateTime? updatedAt;
  final String? coverPhoto;
  final User? user;

  Map<String, dynamic> toJson() => _$UserCollectionToJson(this);

  @override
  List<Object?> get props =>
      [id, title, publishedAt, lastCollectedAt, updatedAt, coverPhoto, user];
}
