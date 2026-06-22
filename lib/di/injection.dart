import 'package:core/core.dart';
import 'package:domain/di/injection.module.dart';
import 'package:feature/di/injection.module.dart';
import 'package:network/di/injection.module.dart';
import 'package:storage/di/injection.module.dart';

import 'injection.config.dart';

final GetIt getIt = GetIt.I;

@InjectableInit(
  preferRelativeImports: true,
  externalPackageModulesBefore: [
    ExternalModule(NetworkPackageModule),
    ExternalModule(DomainPackageModule),
    ExternalModule(FeaturePackageModule),
    ExternalModule(StoragePackageModule),
  ],
)
Future<void> appInjection() => getIt.init();
