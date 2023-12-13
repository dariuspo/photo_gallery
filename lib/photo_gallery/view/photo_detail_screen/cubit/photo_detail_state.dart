part of 'photo_detail_cubit.dart';

@CopyWith(copyWithNull: true)
class PhotoDetailState extends Equatable {
  const PhotoDetailState({
    required this.photo,
    this.blocState = BlocState.initial,
    this.message,
    this.detailedPhoto,
  });

  final BlocState blocState;
  final String? message;
  final Photo photo;
  final Photo? detailedPhoto;

  @override
  List<Object?> get props => [photo, blocState, message, detailedPhoto];
}
