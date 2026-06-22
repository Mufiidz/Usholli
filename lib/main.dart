import 'package:core/core.dart';
import 'package:domain/domain.init.dart' as domain_mappable;
import 'package:feature/feature.init.dart' as feature_mappable;
import 'package:feature/feature_router.dart';
import 'package:flutter/material.dart';
import 'package:network/core_network.init.dart' as core_network_mappable;

import 'app_router.dart';
import 'di/injection.dart';

void main() async {
  await initializeApp();
  runApp(const MyApp());
}

Future<void> initializeApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await appInjection();
  core_network_mappable.initializeMappers();
  domain_mappable.initializeMappers();
  feature_mappable.initializeMappers();
  await initializeDateFormatting('id', 'ID');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      routerConfig: _router,
      themeMode: ThemeMode.system,
      theme: context.materialTheme.light(),
      darkTheme: context.materialTheme.darkMediumContrast(),
      builder: (context, child) {
        AppSize.init(context);
        return child ?? const SizedBox.shrink();
      },
    );
  }
}

final GoRouter _router = GoRouter(initialLocation: SplashRoute().location, routes: [...appRoutes, ...featureRoutes]);
