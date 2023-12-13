part of 'photo_list_bloc.dart';

@CopyWith(copyWithNull: true)
class PhotoListState extends Equatable {
  const PhotoListState({
    this.blocState = BlocState.initial,
    this.message,
    this.photos = const [],
    this.reachedMax = false,
    this.query = '',
  });

  final BlocState blocState;
  final String? message;
  final String query;
  final bool reachedMax;
  final List<Photo> photos;

  @override
  List<Object?> get props => [photos, blocState, message, query, reachedMax];
}
