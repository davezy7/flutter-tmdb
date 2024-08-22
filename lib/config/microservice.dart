import 'package:envied/envied.dart';

part 'microservice.g.dart';

@Envied(path: 'microservice.env')
abstract class Microservice {
  @EnviedField(varName: 'V3_MOVIE', defaultValue: '', obfuscate: true)
  static final String v3Movie = _Microservice.v3Movie;
  @EnviedField(varName: 'V3_SEARCH', defaultValue: '', obfuscate: true)
  static final String v3Search = _Microservice.v3Search;
}
