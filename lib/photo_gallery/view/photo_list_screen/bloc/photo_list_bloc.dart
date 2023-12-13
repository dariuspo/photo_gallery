import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:photo_gallery/app/bloc/bloc_helper.dart';
import 'package:photo_gallery/app/utils/error_utils.dart';
import 'package:photo_gallery/photo_gallery/data/models/photo/photo.dart';
import 'package:photo_gallery/photo_gallery/data/repositories/unsplash_repository.dart';
import 'package:stream_transform/stream_transform.dart';

part 'photo_list_bloc.g.dart';

part 'photo_list_event.dart';

part 'photo_list_state.dart';

const _duration = Duration(milliseconds: 500);

EventTransformer<Event> debounce<Event>(Duration duration) {
  return (events, mapper) => events.debounce(duration).switchMap(mapper);
}

class PhotoListBloc extends Bloc<PhotoListEvent, PhotoListState> {
  PhotoListBloc(this._unsplashRepository) : super(const PhotoListState()) {
    on<FetchPhotos>(_onFetchPhotos);
    on<SearchPhotos>(_onSearchPhotos, transformer: debounce(_duration));
  }

  final UnsplashRepository _unsplashRepository;
  final int perPage = 10;

  Future<void> _onFetchPhotos(
    FetchPhotos event,
    Emitter<PhotoListState> emit,
  ) async {
    if (state.blocState.isLoading || state.reachedMax) return;
    final currentPhotos = List<Photo>.from(state.photos);
    if (currentPhotos.isEmpty) {
      emit(state.copyWith(blocState: BlocState.loading));
    }
    try {
      late List<Photo> photos;
      if (state.query.isEmpty) {
        photos = await _unsplashRepository.getPhotos(
          page: (currentPhotos.length / perPage).floor() + 1,
          perPage: perPage,
        );
      } else {
        final searchResult = await _unsplashRepository.searchPhoto(
          query: state.query,
          page: (currentPhotos.length / perPage).floor() + 1,
          perPage: perPage,
        );
        photos = List<Photo>.from(searchResult.results ?? []);
      }
      final reachedMax = photos.length < perPage;
      emit(
        state.copyWith(
          blocState: BlocState.success,
          photos: currentPhotos..addAll(photos),
          reachedMax: reachedMax,
        ),
      );
    } catch (e, st) {
      final message = ErrorUtils.getErrorMessage(e, st);
      emit(state.copyWith(blocState: BlocState.failure, message: message));
    }
  }

  Future<void> _onSearchPhotos(
    SearchPhotos event,
    Emitter<PhotoListState> emit,
  ) async {
    if (event.query.length < 3 && event.query.isNotEmpty) return;
    if (state.query == event.query) return;
    emit(state.copyWith(blocState: BlocState.loading));

    try {
      late List<Photo> photos;
      if (event.query.isEmpty) {
        photos = await _unsplashRepository.getPhotos(
          page: 1,
          perPage: perPage,
        );
      } else {
        final searchResult = await _unsplashRepository.searchPhoto(
          query: event.query,
          page: 1,
          perPage: perPage,
        );
        photos = List<Photo>.from(searchResult.results ?? []);
      }

      final reachedMax = photos.length < perPage;
      emit(
        state.copyWith(
          blocState: BlocState.success,
          photos: photos,
          reachedMax: reachedMax,
          query: event.query,
        ),
      );
    } catch (e, st) {
      final message = ErrorUtils.getErrorMessage(e, st);
      emit(state.copyWith(blocState: BlocState.failure, message: message));
    }
  }
}
