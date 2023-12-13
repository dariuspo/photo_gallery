// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Photo _$PhotoFromJson(Map<String, dynamic> json) => Photo(
      id: json['id'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      width: json['width'] as num?,
      height: json['height'] as num?,
      color: json['color'] as String?,
      blurHash: json['blur_hash'] as String?,
      likes: json['likes'] as num?,
      views: json['views'] as num?,
      downloads: json['downloads'] as num?,
      location: json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, dynamic>),
      tags: (json['tags'] as List<dynamic>?)
              ?.map((e) => Tag.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      likedByUser: json['liked_by_user'] as bool?,
      description: json['description'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      currentUserCollections:
          (json['current_user_collections'] as List<dynamic>?)
              ?.map((e) => UserCollection.fromJson(e as Map<String, dynamic>))
              .toList(),
      urls: json['urls'] == null
          ? null
          : Urls.fromJson(json['urls'] as Map<String, dynamic>),
      links: json['links'] == null
          ? null
          : PhotoLinks.fromJson(json['links'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PhotoToJson(Photo instance) => <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'width': instance.width,
      'height': instance.height,
      'likes': instance.likes,
      'views': instance.views,
      'tags': instance.tags,
      'downloads': instance.downloads,
      'location': instance.location,
      'color': instance.color,
      'blur_hash': instance.blurHash,
      'liked_by_user': instance.likedByUser,
      'description': instance.description,
      'user': instance.user,
      'current_user_collections': instance.currentUserCollections,
      'urls': instance.urls,
      'links': instance.links,
    };

PhotoLinks _$PhotoLinksFromJson(Map<String, dynamic> json) => PhotoLinks(
      self: json['self'] as String?,
      html: json['html'] as String?,
      download: json['download'] as String?,
      downloadLocation: json['download_location'] as String?,
    );

Map<String, dynamic> _$PhotoLinksToJson(PhotoLinks instance) =>
    <String, dynamic>{
      'self': instance.self,
      'html': instance.html,
      'download': instance.download,
      'download_location': instance.downloadLocation,
    };

Urls _$UrlsFromJson(Map<String, dynamic> json) => Urls(
      raw: json['raw'] as String?,
      full: json['full'] as String?,
      regular: json['regular'] as String?,
      small: json['small'] as String?,
      thumb: json['thumb'] as String?,
    );

Map<String, dynamic> _$UrlsToJson(Urls instance) => <String, dynamic>{
      'raw': instance.raw,
      'full': instance.full,
      'regular': instance.regular,
      'small': instance.small,
      'thumb': instance.thumb,
    };

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
      name: json['name'] as String?,
      city: json['city'],
      country: json['country'],
      position: json['position'] == null
          ? null
          : Position.fromJson(json['position'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'name': instance.name,
      'city': instance.city,
      'country': instance.country,
      'position': instance.position,
    };

Position _$PositionFromJson(Map<String, dynamic> json) => Position(
      latitude: json['latitude'] as num?,
      longitude: json['longitude'] as num?,
    );

Map<String, dynamic> _$PositionToJson(Position instance) => <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };

Tag _$TagFromJson(Map<String, dynamic> json) => Tag(
      type: json['type'] as String?,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$TagToJson(Tag instance) => <String, dynamic>{
      'type': instance.type,
      'title': instance.title,
    };
