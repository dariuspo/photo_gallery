import 'package:dio/dio.dart';
import 'package:photo_gallery/photo_gallery/data/models/photo/photo.dart';
import 'package:photo_gallery/photo_gallery/data/models/search_result/search_result.dart';
import 'package:retrofit/retrofit.dart';

part 'photo_repository.g.dart';

@RestApi()
abstract class PhotoRepository {
  factory PhotoRepository(Dio dio, {String baseUrl}) =
      _PhotoRepository;

  @GET('photos')
  Future<List<Photo>> getPhotos({
    @Query('page') required int page,
    @Query('per_page') required int perPage,
  });

  @GET('photos/{id}')
  Future<Photo> getDetailPhoto({
    @Path('id') required String id,
  });

  @GET('search/photos')
  Future<SearchResult> searchPhoto({
    @Query('query') required String query,
    @Query('page') required int page,
    @Query('per_page') required int perPage,
  });
}
