import 'package:core/core.dart';
import 'package:flutter/material.dart';

import 'splash/splash_screen.dart';

part 'app_router.g.dart';

@TypedGoRoute<SplashRoute>(path: '/')
class SplashRoute extends GoRouteData with $SplashRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SplashScreen();
  }
}

List<RouteBase> get appRoutes => $appRoutes;
