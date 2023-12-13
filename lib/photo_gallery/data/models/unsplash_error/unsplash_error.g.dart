// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unsplash_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UnsplashError _$UnsplashErrorFromJson(Map<String, dynamic> json) =>
    UnsplashError(
      errors:
          (json['errors'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$UnsplashErrorToJson(UnsplashError instance) =>
    <String, dynamic>{
      'errors': instance.errors,
    };
