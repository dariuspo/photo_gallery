import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_gallery/app/view/app_bloc_provider.dart';
import 'package:photo_gallery/photo_gallery/data/repositories/unsplash_repository.dart';

/// [AppRepositoryProvider] is refactor class contains all repository of the app
/// the refactor to prevent cluttering when lot of repository added
class AppRepositoryProvider extends StatelessWidget {

  /// The repository provider is used for easier testing using
  /// MockRepository because we do DI to the bloc
  const AppRepositoryProvider({
    required UnsplashRepository unsplashRepository,
    super.key,
  }) : _unsplashRepository = unsplashRepository;

  final UnsplashRepository _unsplashRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: _unsplashRepository),
      ],
      child: const AppBlocProvider(),
    );
  }
}
