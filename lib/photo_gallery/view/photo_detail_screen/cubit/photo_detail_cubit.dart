import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:photo_gallery/app/bloc/bloc_helper.dart';
import 'package:photo_gallery/app/utils/error_utils.dart';
import 'package:photo_gallery/photo_gallery/data/models/photo/photo.dart';
import 'package:photo_gallery/photo_gallery/data/repositories/unsplash_repository.dart';

part 'photo_detail_cubit.g.dart';

part 'photo_detail_state.dart';

class PhotoDetailCubit extends Cubit<PhotoDetailState> {
  PhotoDetailCubit(this._unsplashRepository, this._photo)
      : super(PhotoDetailState(photo: _photo));

  final Photo _photo;
  final UnsplashRepository _unsplashRepository;

  Future<void> getDetailedPhoto() async {
    emit(state.copyWith(blocState: BlocState.loading, photo: _photo));
    try {
      final detailedPhoto = await _unsplashRepository.getDetailPhoto(
        id: _photo.id ?? '',
      );
      emit(
        state.copyWith(
          blocState: BlocState.success,
          detailedPhoto: detailedPhoto,
        ),
      );
    } catch (e, st) {
      final message = ErrorUtils.getErrorMessage(e, st);
      emit(state.copyWith(blocState: BlocState.failure, message: message));
    }
  }
}
