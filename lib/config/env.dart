import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: 'secret.env')
abstract class Env {
  @EnviedField(varName: 'API_KEY', defaultValue: '', obfuscate: true)
  static final String apiKey = _Env.apiKey;
  @EnviedField(varName: 'BASE_URL', defaultValue: '', obfuscate: true)
  static final String baseUrl = _Env.baseUrl;
}
