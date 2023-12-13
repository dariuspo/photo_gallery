import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'unsplash_error.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class UnsplashError extends Equatable {

  const UnsplashError({
    this.errors,
  });
  factory UnsplashError.fromJson(Map<String, dynamic> json) =>
      _$UnsplashErrorFromJson(json);
  final List<String>? errors;

  Map<String, dynamic> toJson() => _$UnsplashErrorToJson(this);

  @override
  List<Object?> get props => [errors];
}
