import 'package:envied/envied.dart';

part 'unsplash_env.g.dart';

/// add all the content of env folder to gitignore list
/// to prevent key leaking
@Envied(path: 'env/unsplash_env.env')
abstract class UnsplashEnv {
  @EnviedField(varName: 'ACCESS_KEY', obfuscate: true)
  static final String accessKey = _UnsplashEnv.accessKey;
}
