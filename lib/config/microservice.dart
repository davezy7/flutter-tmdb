import 'package:envied/envied.dart';

part 'microservice.g.dart';

@Envied(path: 'microservice.env')
abstract class Microservice {
  @EnviedField(varName: 'V3_MOVIE', defaultValue: '', obfuscate: true)
  static final String v3Movie = _Env.v3Movie;
}
