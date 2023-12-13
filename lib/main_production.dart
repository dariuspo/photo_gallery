import 'package:photo_gallery/app/view/app_repository_provider.dart';
import 'package:photo_gallery/bootstrap.dart';
import 'package:photo_gallery/photo_gallery/photo_gallery.dart';

/// Production environment configuration
void main() {
  bootstrap(
    () => AppRepositoryProvider(
      unsplashRepository: UnsplashRepository(dio: Api.client),
    ),
  );
}
