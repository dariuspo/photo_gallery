import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:photo_gallery/app/utils/string_extensions.dart';
import 'package:photo_gallery/photo_gallery/data/models/user/user.dart';
import 'package:photo_gallery/photo_gallery/data/models/user_collection/user_collection.dart';

part 'photo.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Photo extends Equatable {
  const Photo({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.width,
    this.height,
    this.color,
    this.blurHash,
    this.likes,
    this.views,
    this.downloads,
    this.location,
    this.tags = const [],
    this.likedByUser,
    this.description,
    this.user,
    this.currentUserCollections,
    this.urls,
    this.links,
  });

  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);
  final String? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final num? width;
  final num? height;
  final num? likes;
  final num? views;
  final List<Tag> tags;
  final num? downloads;
  final Location? location;
  final String? color;
  final String? blurHash;
  final bool? likedByUser;
  final String? description;
  final User? user;
  final List<UserCollection>? currentUserCollections;
  final Urls? urls;
  final PhotoLinks? links;

  Map<String, dynamic> toJson() => _$PhotoToJson(this);

  @override
  List<Object?> get props => [
        id,
        createdAt,
        updatedAt,
        width,
        height,
        color,
        blurHash,
        likes,
        views,
        downloads,
        location,
        likedByUser,
        description,
        user,
        currentUserCollections,
        urls,
        links,
      ];
}

@JsonSerializable(fieldRename: FieldRename.snake)
class PhotoLinks extends Equatable {
  const PhotoLinks({
    this.self,
    this.html,
    this.download,
    this.downloadLocation,
  });

  factory PhotoLinks.fromJson(Map<String, dynamic> json) =>
      _$PhotoLinksFromJson(json);
  final String? self;
  final String? html;
  final String? download;
  final String? downloadLocation;

  Map<String, dynamic> toJson() => _$PhotoLinksToJson(this);

  @override
  List<Object?> get props => [self, html, download, downloadLocation];
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Urls extends Equatable {
  const Urls({
    this.raw,
    this.full,
    this.regular,
    this.small,
    this.thumb,
  });

  factory Urls.fromJson(Map<String, dynamic> json) => _$UrlsFromJson(json);
  final String? raw;
  final String? full;
  final String? regular;
  final String? small;
  final String? thumb;

  @override
  List<Object?> get props => [raw, full, regular, small, thumb];

  Map<String, dynamic> toJson() => _$UrlsToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Location extends Equatable {

  const Location({
    this.name,
    this.city,
    this.country,
    this.position,
  });

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
  final String? name;
  final dynamic city;
  final dynamic country;
  final Position? position;

  Map<String, dynamic> toJson() => _$LocationToJson(this);

  @override
  List<Object?> get props => [
        name,
        city,
        country,
        position,
      ];
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Position extends Equatable {

  const Position({
    this.latitude,
    this.longitude,
  });

  factory Position.fromJson(Map<String, dynamic> json) =>
      _$PositionFromJson(json);
  final num? latitude;
  final num? longitude;

  Map<String, dynamic> toJson() => _$PositionToJson(this);

  @override
  List<Object?> get props => [
        latitude,
        longitude,
      ];
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Tag extends Equatable {

  const Tag({
    this.type,
    this.title,
  });

  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);
  final String? type;
  final String? title;

  String get titleView => title.camelCase();

  Map<String, dynamic> toJson() => _$TagToJson(this);

  @override
  List<Object?> get props => [
        type,
        title,
      ];
}
