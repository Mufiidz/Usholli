import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '../../.env', useConstantCase: true)
abstract class Env {
  @EnviedField()
  static const String sholatBaseUrl = _Env.sholatBaseUrl;
  @EnviedField(varName: 'DB_NAME')
  static const String databaseName = _Env.databaseName;
  @EnviedField(varName: 'QURAN_QCF_BASE_URL')
  static const String quranBaseUrl = _Env.quranBaseUrl;
}
