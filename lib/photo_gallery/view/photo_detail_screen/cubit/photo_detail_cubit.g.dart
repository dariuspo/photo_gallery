// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_detail_cubit.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PhotoDetailStateCWProxy {
  PhotoDetailState photo(Photo photo);

  PhotoDetailState blocState(BlocState blocState);

  PhotoDetailState message(String? message);

  PhotoDetailState detailedPhoto(Photo? detailedPhoto);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PhotoDetailState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PhotoDetailState(...).copyWith(id: 12, name: "My name")
  /// ````
  PhotoDetailState call({
    Photo? photo,
    BlocState? blocState,
    String? message,
    Photo? detailedPhoto,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPhotoDetailState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPhotoDetailState.copyWith.fieldName(...)`
class _$PhotoDetailStateCWProxyImpl implements _$PhotoDetailStateCWProxy {
  const _$PhotoDetailStateCWProxyImpl(this._value);

  final PhotoDetailState _value;

  @override
  PhotoDetailState photo(Photo photo) => this(photo: photo);

  @override
  PhotoDetailState blocState(BlocState blocState) => this(blocState: blocState);

  @override
  PhotoDetailState message(String? message) => this(message: message);

  @override
  PhotoDetailState detailedPhoto(Photo? detailedPhoto) =>
      this(detailedPhoto: detailedPhoto);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PhotoDetailState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PhotoDetailState(...).copyWith(id: 12, name: "My name")
  /// ````
  PhotoDetailState call({
    Object? photo = const $CopyWithPlaceholder(),
    Object? blocState = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? detailedPhoto = const $CopyWithPlaceholder(),
  }) {
    return PhotoDetailState(
      photo: photo == const $CopyWithPlaceholder() || photo == null
          ? _value.photo
          // ignore: cast_nullable_to_non_nullable
          : photo as Photo,
      blocState: blocState == const $CopyWithPlaceholder() || blocState == null
          ? _value.blocState
          // ignore: cast_nullable_to_non_nullable
          : blocState as BlocState,
      message: message == const $CopyWithPlaceholder()
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String?,
      detailedPhoto: detailedPhoto == const $CopyWithPlaceholder()
          ? _value.detailedPhoto
          // ignore: cast_nullable_to_non_nullable
          : detailedPhoto as Photo?,
    );
  }
}

extension $PhotoDetailStateCopyWith on PhotoDetailState {
  /// Returns a callable class that can be used as follows: `instanceOfPhotoDetailState.copyWith(...)` or like so:`instanceOfPhotoDetailState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PhotoDetailStateCWProxy get copyWith => _$PhotoDetailStateCWProxyImpl(this);

  /// Copies the object with the specific fields set to `null`. If you pass `false` as a parameter, nothing will be done and it will be ignored. Don't do it. Prefer `copyWith(field: null)` or `PhotoDetailState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PhotoDetailState(...).copyWithNull(firstField: true, secondField: true)
  /// ````
  PhotoDetailState copyWithNull({
    bool message = false,
    bool detailedPhoto = false,
  }) {
    return PhotoDetailState(
      photo: photo,
      blocState: blocState,
      message: message == true ? null : this.message,
      detailedPhoto: detailedPhoto == true ? null : this.detailedPhoto,
    );
  }
}
