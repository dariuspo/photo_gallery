import 'package:dio/dio.dart';
import 'package:photo_gallery/photo_gallery/data/data_providers/photo_repository.dart';
import 'package:photo_gallery/photo_gallery/data/models/photo/photo.dart';
import 'package:photo_gallery/photo_gallery/data/models/search_result/search_result.dart';

/// Implement [PhotoRepository] interface to make sure all the methods is used
/// this also support auto method generation via code editor when new method
/// is added to the interface class
class UnsplashRepository implements PhotoRepository {
  UnsplashRepository({required Dio dio}) : _provider = PhotoRepository(dio);
  final PhotoRepository _provider;

  @override
  Future<List<Photo>> getPhotos({required int page, required int perPage}) {
    return _provider.getPhotos(page: page, perPage: perPage);
  }

  @override
  Future<Photo> getDetailPhoto({required String id}) {
    return _provider.getDetailPhoto(id: id);
  }

  @override
  Future<SearchResult> searchPhoto({
    required String query,
    required int page,
    required int perPage,
  }) {
    return _provider.searchPhoto(perPage: perPage, page: page, query: query);
  }
}
