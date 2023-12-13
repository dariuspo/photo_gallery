import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class User extends Equatable {
  const User({
    this.id,
    this.username,
    this.name,
    this.portfolioUrl,
    this.bio,
    this.location,
    this.totalLikes,
    this.totalPhotos,
    this.totalCollections,
    this.instagramUsername,
    this.twitterUsername,
    this.profileImage,
    this.links,
  });

  factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);

  final String? id;
  final String? username;
  final String? name;
  final String? portfolioUrl;
  final String? bio;
  final String? location;
  final int? totalLikes;
  final int? totalPhotos;
  final int? totalCollections;
  final String? instagramUsername;
  final String? twitterUsername;
  final ProfileImage? profileImage;
  final Links? links;

  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  List<Object?> get props => [
        id,
        username,
        name,
        portfolioUrl,
        bio,
        location,
        totalLikes,
        totalPhotos,
        totalCollections,
        instagramUsername,
        twitterUsername,
        profileImage,
        links,
      ];
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Links extends Equatable {
  const Links({
    this.self,
    this.html,
    this.photos,
    this.likes,
    this.portfolio,
  });

  factory Links.fromJson(Map<String, dynamic> json) =>
      _$LinksFromJson(json);

  final String? self;
  final String? html;
  final String? photos;
  final String? likes;
  final String? portfolio;

  Map<String, dynamic> toJson() => _$LinksToJson(this);

  @override
  List<Object?> get props => [self, html, photos, likes, portfolio];
}

@JsonSerializable(fieldRename: FieldRename.snake)
class ProfileImage extends Equatable {
  const ProfileImage({
    this.small,
    this.medium,
    this.large,
  });

  factory ProfileImage.fromJson(Map<String, dynamic> json) =>
      _$ProfileImageFromJson(json);

  final String? small;
  final String? medium;
  final String? large;

  Map<String, dynamic> toJson() => _$ProfileImageToJson(this);

  @override
  List<Object?> get props => [small, medium, large];
}
