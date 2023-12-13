// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_list_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PhotoListStateCWProxy {
  PhotoListState blocState(BlocState blocState);

  PhotoListState message(String? message);

  PhotoListState photos(List<Photo> photos);

  PhotoListState reachedMax(bool reachedMax);

  PhotoListState query(String query);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PhotoListState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PhotoListState(...).copyWith(id: 12, name: "My name")
  /// ````
  PhotoListState call({
    BlocState? blocState,
    String? message,
    List<Photo>? photos,
    bool? reachedMax,
    String? query,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPhotoListState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPhotoListState.copyWith.fieldName(...)`
class _$PhotoListStateCWProxyImpl implements _$PhotoListStateCWProxy {
  const _$PhotoListStateCWProxyImpl(this._value);

  final PhotoListState _value;

  @override
  PhotoListState blocState(BlocState blocState) => this(blocState: blocState);

  @override
  PhotoListState message(String? message) => this(message: message);

  @override
  PhotoListState photos(List<Photo> photos) => this(photos: photos);

  @override
  PhotoListState reachedMax(bool reachedMax) => this(reachedMax: reachedMax);

  @override
  PhotoListState query(String query) => this(query: query);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PhotoListState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PhotoListState(...).copyWith(id: 12, name: "My name")
  /// ````
  PhotoListState call({
    Object? blocState = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? photos = const $CopyWithPlaceholder(),
    Object? reachedMax = const $CopyWithPlaceholder(),
    Object? query = const $CopyWithPlaceholder(),
  }) {
    return PhotoListState(
      blocState: blocState == const $CopyWithPlaceholder() || blocState == null
          ? _value.blocState
          // ignore: cast_nullable_to_non_nullable
          : blocState as BlocState,
      message: message == const $CopyWithPlaceholder()
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String?,
      photos: photos == const $CopyWithPlaceholder() || photos == null
          ? _value.photos
          // ignore: cast_nullable_to_non_nullable
          : photos as List<Photo>,
      reachedMax:
          reachedMax == const $CopyWithPlaceholder() || reachedMax == null
              ? _value.reachedMax
              // ignore: cast_nullable_to_non_nullable
              : reachedMax as bool,
      query: query == const $CopyWithPlaceholder() || query == null
          ? _value.query
          // ignore: cast_nullable_to_non_nullable
          : query as String,
    );
  }
}

extension $PhotoListStateCopyWith on PhotoListState {
  /// Returns a callable class that can be used as follows: `instanceOfPhotoListState.copyWith(...)` or like so:`instanceOfPhotoListState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PhotoListStateCWProxy get copyWith => _$PhotoListStateCWProxyImpl(this);

  /// Copies the object with the specific fields set to `null`. If you pass `false` as a parameter, nothing will be done and it will be ignored. Don't do it. Prefer `copyWith(field: null)` or `PhotoListState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PhotoListState(...).copyWithNull(firstField: true, secondField: true)
  /// ````
  PhotoListState copyWithNull({
    bool message = false,
  }) {
    return PhotoListState(
      blocState: blocState,
      message: message == true ? null : this.message,
      photos: photos,
      reachedMax: reachedMax,
      query: query,
    );
  }
}
